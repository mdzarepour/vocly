import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:vocly/app/core/enum/enum/enums.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/modules/home/controller/search_controller.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/empty_state.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';
import 'package:vocly/app/shared/widget/vocly_loading.dart';

class SearchPage extends GetView<WordSearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SearchAppBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (controller.paginator.onScroll(notification)) {
            controller.loadMore();
          }
          return false;
        },
        child: const _SearchBody(),
      ),
    );
  }
}

class _SearchAppBar extends GetView<WordSearchController>
    implements PreferredSizeWidget {
  const _SearchAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // bottom border
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.8),
        child: Container(height: 0.8, color: UiColor.firsColor),
      ),
      actionsPadding: const EdgeInsets.only(right: 30),
      // --- serach textField
      title: TextField(
        cursorColor: UiColor.thirdColor,
        style: VoclyTypography.titleMedium,
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
        ),
        onChanged: (value) => controller.updateQuery(q: value),
      ),
      // --- search loading
      actions: [
        Obx(() {
          if (controller.loading == SearchLoading.search) {
            return const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchBody extends GetView<WordSearchController> {
  const _SearchBody();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // --- initial loading
      if (controller.loading == SearchLoading.init) {
        return const VoclyLoading();
      }
      // --- empty state
      if (controller.words.isEmpty) {
        return const EmptyState();
      }
      return const _WordsList();
    });
  }
}

class _WordsList extends GetView<WordSearchController> {
  const _WordsList();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final words = controller.words;
      final query = controller.query;
      final isLoadingMore = controller.paginator.isLoadingMore;
      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 25)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // --- listView
            sliver: SliverList.builder(
              itemCount: words.length,
              // --- word item
              itemBuilder: (context, index) {
                final word = words[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _SearchTile(
                    key: ValueKey(word.id),
                    word: word,
                    query: query,
                    // --- navigate to details screen
                    onTap: () {
                      controller.toWordDetailsPage(id: word.id);
                    },
                  ),
                );
              },
            ),
          ),
          // --- footer loading
          if (isLoadingMore)
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 25),
              sliver: SliverToBoxAdapter(child: VoclyLoading()),
            ),
        ],
      );
    });
  }
}

class _SearchTile extends StatelessWidget {
  final Word word;
  final String query;
  final void Function()? onTap;

  const _SearchTile({
    super.key,
    required this.word,
    required this.query,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = VoclyTypography.titleMedium;
    return InkWell(
      onTap: onTap,
      child: VoclyCard(
        height: 70,

        child: Row(
          children: [
            Expanded(
              child: Column(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- name
                  SubstringHighlight(
                    text: word.name,
                    term: query,
                    overflow: TextOverflow.ellipsis,
                    textStyle: textStyle,
                    textStyleHighlight: textStyle.copyWith(
                      color: UiColor.blueHighLightColor,
                    ),
                  ),
                  // --- example
                  SubstringHighlight(
                    text: word.example,
                    term: query,
                    overflow: TextOverflow.ellipsis,
                    textStyle: textStyle,
                    textStyleHighlight: textStyle.copyWith(
                      color: UiColor.blueHighLightColor,
                    ),
                  ),
                ],
              ),
            ),
            // --- icon
            Icon(VoclyIcon.children[word.icon]),
          ],
        ),
      ),
    );
  }
}
