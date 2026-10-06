import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/data/model/book.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/modules/home/controller/book_details_controller.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/empty_state.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';
import 'package:vocly/app/shared/widget/vocly_loading.dart';
import 'package:vocly/app/shared/widget/word_tile.dart';

class BookDetailsPage extends GetView<BookDetailsController> {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Review book', style: VoclyTypography.titleMedium),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (controller.paginator.onScroll(notification)) {
            controller.fetchWords();
          }
          return false;
        },
        child: const CustomScrollView(
          cacheExtent: 500,
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(child: _BookCard()),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(child: _EditButton()),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            _WordsGrid(),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// BOOK CARD
// -------------------------------------------------------------

class _BookCard extends GetView<BookDetailsController> {
  const _BookCard();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final book = controller.book;

      if (book == null) {
        return const VoclyCard(height: 200, child: VoclyLoading());
      }

      return FlipCard(
        direction: FlipDirection.VERTICAL,
        speed: 250,
        front: _BookCardFront(book: book),
        back: _BookCardBack(book: book),
      );
    });
  }
}

class _BookCardFront extends StatelessWidget {
  final Book book;

  const _BookCardFront({required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VoclyCard(
          borderColor: VoclyColor.children[book.color],
          height: 200,
          child: Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  book.name,
                  textAlign: TextAlign.center,
                  style: VoclyTypography.displayLarge,
                ),
                Text(
                  book.type.name,
                  textAlign: TextAlign.center,
                  style: VoclyTypography.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Icon(VoclyIcon.children[book.icon]),
        ),
      ],
    );
  }
}

class _BookCardBack extends StatelessWidget {
  final Book book;

  const _BookCardBack({required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VoclyCard(
          borderColor: VoclyColor.children[book.color],
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  book.description,
                  textAlign: TextAlign.center,
                  style: VoclyTypography.titleMedium,
                ),
                Text(
                  'Contains ${book.words.length} words',
                  textAlign: TextAlign.center,
                  style: VoclyTypography.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Icon(VoclyIcon.children[book.icon]),
        ),
      ],
    );
  }
}

// -------------------------------------------------------------
// EDIT BUTTON
// -------------------------------------------------------------

class _EditButton extends GetView<BookDetailsController> {
  const _EditButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.toBookCrudPage,
      child: const VoclyCard(
        height: 50,
        child: Center(child: Text('Edit', style: VoclyTypography.titleMedium)),
      ),
    );
  }
}

// -------------------------------------------------------------
// WORDS
// -------------------------------------------------------------

class _WordsGrid extends GetView<BookDetailsController> {
  const _WordsGrid();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final words = controller.words;
      final loading = controller.isLoading;

      if (loading == LoadingStatus.init ||
          (loading == LoadingStatus.working && words.isEmpty)) {
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: VoclyLoading(),
        );
      }

      if (words.isEmpty) {
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: EmptyState(),
        );
      }

      return SliverMainAxisGroup(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 70,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: words.length,
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: true,
              itemBuilder: (context, index) {
                return _WordGridItem(
                  key: ValueKey(words[index].id),
                  word: words[index],
                );
              },
            ),
          ),
          if (controller.paginator.isLoadingMore)
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 25),
              sliver: SliverToBoxAdapter(child: VoclyLoading()),
            ),
        ],
      );
    });
  }
}

class _WordGridItem extends GetView<BookDetailsController> {
  final Word word;

  const _WordGridItem({required this.word, super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: WordTile(
        word: word,
        isSmallTile: true,
        borderColor: UiColor.backgroundColor2,
        onTap: () {
          controller.toWordDetailsPage(id: word.id);
        },
      ),
    );
  }
}
