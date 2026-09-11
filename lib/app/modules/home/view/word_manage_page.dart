import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/modules/home/controller/word_manage_controller.dart';
import 'package:vocly/app/modules/home/view/widget/filter_bottom_sheet.dart';
import 'package:vocly/app/modules/home/view/widget/filter_chip.dart';
import 'package:vocly/app/modules/home/view/widget/sort_bottom_sheet.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/empty_state.dart';
import 'package:vocly/app/shared/widget/vocly_loading.dart';
import 'package:vocly/app/shared/widget/word_tile.dart';

class WordManagePage extends GetView<WordManageController> {
  const WordManagePage({super.key});

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
      bottomNavigationBar: controller.type == WordManagerScreenType.selectWords
          // Selec words button
          ? InkWell(
              onTap: controller.toBackWithSelectedWords,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: UiColor.forthColor,
                  border: Border(
                    top: BorderSide(color: UiColor.backgroundColor2),
                  ),
                ),
                child: const Center(
                  child: Text(style: VoclyTypography.titleMedium, 'Add words'),
                ),
              ),
            )
          : null,
    );
  }
}

class _Body extends GetView<WordManageController> {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loadingState = controller.isLoading;
      final isEmpty = controller.words.isEmpty;
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
          // Filter listView
          const _FilterView(),
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

class _AppBar extends GetView<WordManageController>
    implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Obx(() {
        final isSelectionMode = controller.wordSelection.isSelectionMode;
        final selectedCount = controller.wordSelection.selectedCount;
        final isGridView = controller.layout == ScreenLayout.gridView;
        final words = controller.words;
        return Row(
          children: [
            // Title
            Text(
              isSelectionMode ? '$selectedCount selected' : 'Manage word',
              style: VoclyTypography.titleMedium,
            ),
            const Spacer(),
            // Delete icon
            if (isSelectionMode &&
                controller.type == WordManagerScreenType.manageWords)
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
              onTap: words.isEmpty
                  ? null
                  : () {
                      controller.wordSelection.toggleAll(items: words);
                    },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  words.isNotEmpty &&
                          controller.wordSelection.areAllSelected(items: words)
                      ? Icons.not_interested_outlined
                      : Icons.done_all_outlined,
                ),
              ),
            ),
            // Layout icon
            InkWell(
              onTap: controller.toggleLayout,
              child: SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  isGridView
                      ? Icons.grid_view_outlined
                      : Icons.view_agenda_outlined,
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FilterView extends GetView<WordManageController> {
  const _FilterView();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      expandedHeight: 35,
      toolbarHeight: 35,
      flexibleSpace: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          // Sort chip
          Obx(() {
            return FilterButton(
              icon: Icons.sort,
              title: 'Sort',
              isSelectd: controller.filterState.isAnySortSelected,
              onTap: showSort,
            );
          }),
          // Color chip
          Obx(
            () => FilterButton(
              icon: Icons.invert_colors_on_outlined,
              title: 'Color',
              isSelectd: controller.filterState.colors.isNotEmpty,
              onTap: _showColorFilter,
            ),
          ),
          // Icon chip
          Obx(
            () => FilterButton(
              icon: Icons.workspaces_outlined,
              title: 'Icon',
              isSelectd: controller.filterState.icons.isNotEmpty,
              onTap: _showIconFilter,
            ),
          ),
          // Level chip
          Obx(
            () => FilterButton(
              icon: Icons.back_hand_outlined,
              title: 'Level',
              isSelectd: controller.filterState.levels.isNotEmpty,
              onTap: _showLevelFilter,
            ),
          ),
          // Type chip
          Obx(
            () => FilterButton(
              icon: Icons.assistant_photo_outlined,
              title: 'Type',
              isSelectd: controller.filterState.types.isNotEmpty,
              onTap: _showTypeFilter,
            ),
          ),
        ],
      ),
    );
  }

  void showSort() {
    Get.bottomSheet(
      backgroundColor: UiColor.backgroundColor,
      SortBottomSheet(
        isSelected: (v) => controller.filterState.sort == v,
        onTap: (v) => controller.filterState.changeSort(sortType: v),
        onApply: () => controller.refreshPage(),
      ),
    );
  }

  void _showColorFilter() {
    final draft = controller.filterState.copy();
    Get.bottomSheet(
      backgroundColor: UiColor.backgroundColor,
      FilterBottomSheet<Color>(
        options: VoclyColor.children,
        isSelected: (color) {
          final index = VoclyColor.children.indexOf(color);
          return draft.colors.contains(index);
        },
        onTap: (v) {
          final index = VoclyColor.children.indexOf(v);
          draft.toggleColor(value: index);
        },
        onApply: () {
          controller.filterState.apply(draft);
          controller.refreshPage();
        },
        itemBuilder: (color) => CircleAvatar(radius: 8, backgroundColor: color),
      ),
    );
  }

  void _showIconFilter() {
    final draft = controller.filterState.copy();
    Get.bottomSheet(
      FilterBottomSheet<IconData>(
        options: VoclyIcon.children,
        isSelected: (icon) {
          final index = VoclyIcon.children.indexOf(icon);
          return draft.icons.contains(index);
        },
        onTap: (v) {
          final index = VoclyIcon.children.indexOf(v);
          draft.toggleIcon(value: index);
        },
        onApply: () {
          controller.filterState.apply(draft);
          controller.refreshPage();
        },
        itemBuilder: (icon) => Icon(icon),
      ),
      backgroundColor: UiColor.backgroundColor,
    );
  }

  void _showLevelFilter() {
    final draft = controller.filterState.copy();
    Get.bottomSheet(
      backgroundColor: UiColor.backgroundColor,
      FilterBottomSheet<WordLevel>(
        options: WordLevel.values,
        isSelected: (v) => draft.levels.contains(v),
        onTap: (v) => draft.toggleLevel(value: v),
        onApply: () {
          controller.filterState.apply(draft);
          controller.refreshPage();
        },
      ),
    );
  }

  void _showTypeFilter() {
    final draft = controller.filterState.copy();
    Get.bottomSheet(
      backgroundColor: UiColor.backgroundColor,
      FilterBottomSheet<WordType>(
        options: WordType.values,
        isSelected: (v) => draft.types.contains(v),
        onTap: (v) => draft.toggleType(value: v),
        onApply: () {
          controller.filterState.apply(draft);
          controller.refreshPage();
        },
      ),
    );
  }
}

class _WordsGrid extends GetView<WordManageController> {
  const _WordsGrid();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final words = controller.words;
      final isGrid = controller.layout == ScreenLayout.gridView;
      return SliverPadding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        // Words gridView
        sliver: SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isGrid ? 2 : 1,
            mainAxisExtent: 70,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: words.length,
          itemBuilder: (context, index) {
            // Word item
            return _WordGridItem(word: words[index], isGrid: isGrid);
          },
        ),
      );
    });
  }
}

class _WordGridItem extends GetView<WordManageController> {
  final Word word;
  final bool isGrid;
  const _WordGridItem({required this.word, required this.isGrid});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selection = controller.wordSelection;
      final isSelected = selection.isSelected(word);
      return WordTile(
        key: ValueKey(word.id),
        word: word,
        isSmallTile: isGrid,
        borderColor: isSelected ? UiColor.thirdColor : UiColor.backgroundColor2,
        // start selection
        onLongPress: () {
          selection.select(item: word);
        },
        // navigate or toggle selection
        onTap: () {
          if (selection.isSelectionMode) {
            selection.toggle(item: word);
          } else {
            controller.toWordDetailsPage(id: word.id);
          }
        },
      );
    });
  }
}
