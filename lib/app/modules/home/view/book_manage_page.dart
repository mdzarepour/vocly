import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/data/model/book.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/modules/home/controller/book_manage_controller.dart';
import 'package:vocly/app/modules/home/controller/word_manage_controller.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/empty_state.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';
import 'package:vocly/app/shared/widget/vocly_loading.dart';
import 'package:vocly/app/shared/widget/word_tile.dart';

class BookManagePage extends GetView<BookManageController> {
  const BookManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (controller.paginator.onScroll(notification)) {
            controller.fetchWords();
          }
          return false;
        },
        child: const _Body(),
      ),
    );
  }
}

class _Body extends GetView<BookManageController> {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loadingState = controller.isLoading;
      final isEmpty = controller.books.isEmpty;
      // Initial loading
      if (loadingState == LoadingStatus.init) {
        return const VoclyLoading();
      }
      if (loadingState == LoadingStatus.working && isEmpty) {
        return const VoclyLoading();
      }
      // Body
      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          // Empty state or gridView
          if (isEmpty)
            const SliverFillRemaining(hasScrollBody: false, child: EmptyState())
          else
            const _WordsGrid(),
          // Footer loading
          if (!isEmpty && controller.paginator.isLoadingMore)
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 25),
              sliver: SliverToBoxAdapter(child: VoclyLoading()),
            ),
        ],
      );
    });
  }
}

class _AppBar extends GetView<BookManageController>
    implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Obx(() {
        final isSelectionMode = controller.bookSelection.isSelectionMode;
        final selectedCount = controller.bookSelection.selectedCount;
        final books = controller.books;
        return Row(
          children: [
            // Title
            Text(
              isSelectionMode ? '$selectedCount selected' : 'Manage word',
              style: VoclyTypography.titleMedium,
            ),
            const Spacer(),
            // Delete icon
            if (isSelectionMode)
              InkWell(
                onTap: controller.deleteSelectedWords,
                child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.delete_outline),
                ),
              ),
            // SelectAll icon
            InkWell(
              onTap: books.isEmpty
                  ? null
                  : () => controller.bookSelection.toggleAll(items: books),
              child: SizedBox(
                height: 40,
                width: 40,
                child: Icon(getSelectAllIcon(books: books)),
              ),
            ),
            const SizedBox(width: 20),
          ],
        );
      }),
    );
  }

  IconData getSelectAllIcon({required List<Book> books}) {
    return books.isNotEmpty &&
            controller.bookSelection.areAllSelected(items: books)
        ? Icons.not_interested_outlined
        : Icons.done_all_outlined;
  }

  IconData getLayoutIcon({required bool isGridView}) {
    return isGridView ? Icons.grid_view_outlined : Icons.view_agenda_outlined;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WordsGrid extends GetView<BookManageController> {
  const _WordsGrid();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final books = controller.books;
      return SliverPadding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        // Words gridView
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            // Word item
            return _BookGridItem(book: books[index]);
          },
        ),
      );
    });
  }
}

class _BookGridItem extends GetView<BookManageController> {
  final Book book;
  const _BookGridItem({required this.book});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selection = controller.bookSelection;
      final isSelected = selection.isSelected(book);
      return InkWell(
        onLongPress: () {
          selection.select(item: book);
        },
        onTap: () {
          if (selection.isSelectionMode) {
            selection.toggle(item: book);
          } else {
            //   controller.toWordDetailsPage(id: word.id);
          }
        },
        child: Stack(
          children: [
            VoclyCard(
              key: ValueKey(book.id),
              borderColor: getBorderColor(isSelected: isSelected),
              child: Text(book.name, style: VoclyTypography.titleMedium),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Row(
                spacing: 5,
                children: [
                  Icon(VoclyIcon.children[book.icon]),
                  Text(book.type.name, style: VoclyTypography.bodySmall),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Color getBorderColor({required bool isSelected}) {
    return isSelected ? UiColor.thirdColor : UiColor.backgroundColor2;
  }
}
