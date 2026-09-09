import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vocly/app/core/enum/enum/enums.dart';
import 'package:vocly/app/modules/home/controller/word_crud_controller.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/property_selector.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';
import 'package:vocly/app/shared/widget/vocly_input.dart';
import 'package:vocly/app/shared/widget/vocly_snackbar.dart';

class WordCrudPage extends GetView<WordCrudController> {
  const WordCrudPage({super.key});

  bool get _isEditing => controller.screenType != WordScreenType.addBook;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocus,
      child: Scaffold(
        // --- appbar
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            _isEditing ? 'Edit word' : 'Add new word',
            style: VoclyTypography.titleMedium,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: controller.formKey,
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                // --- title
                const SliverToBoxAdapter(
                  child: _SectionTitle(title: 'Word details'),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                // --- name input
                SliverToBoxAdapter(
                  child: VoclyInput(
                    controller: controller.nameController,
                    icon: Icons.language_outlined,
                    hint: 'Name',
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // --- meaning input
                SliverToBoxAdapter(
                  child: VoclyInput(
                    controller: controller.meaningController,
                    icon: Icons.lightbulb_outline,
                    hint: 'Meaning',
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // --- example input
                SliverToBoxAdapter(
                  child: VoclyInput(
                    controller: controller.exampleController,
                    icon: Icons.segment_outlined,
                    hint: 'Example',
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // --- type
                _typeSelector(),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // --- level
                _levelSelector(),
                const SliverToBoxAdapter(child: SizedBox(height: 50)),
                // --- title
                const SliverToBoxAdapter(
                  child: _SectionTitle(title: 'Word visual'),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // --- icon
                _iconSelector(),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // --- color
                _colorSelector(),
                const SliverToBoxAdapter(child: SizedBox(height: 25)),
                // --- buuttons
                _actionButtons(),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _typeSelector() {
    return SliverToBoxAdapter(
      child: Obx(() {
        return PropertySelector<WordType>(
          title: 'Type',
          properties: WordType.values,
          selectedProperty: controller.type.value,
          onSelected: (type) {
            controller.type.value = type;
          },
          childBuilder: (type) {
            return Text(
              '${type.name.capitalizeFirst}',
              style: VoclyTypography.bodyMedium,
            );
          },
        );
      }),
    );
  }

  Widget _levelSelector() {
    return SliverToBoxAdapter(
      child: Obx(() {
        return PropertySelector<WordLevel>(
          title: 'Level',
          properties: WordLevel.values,
          selectedProperty: controller.level.value,
          onSelected: (level) {
            controller.level.value = level;
          },
          childBuilder: (level) {
            return Text(
              '${level.name.capitalizeFirst}',
              style: VoclyTypography.bodyMedium,
            );
          },
        );
      }),
    );
  }

  Widget _iconSelector() {
    const icons = VoclyIcon.children;

    return SliverToBoxAdapter(
      child: Obx(() {
        final selectedIndex = controller.icon.value;

        return PropertySelector<IconData>(
          title: 'Icon',
          properties: icons,
          selectedProperty: icons[selectedIndex],
          onSelected: (icon) {
            controller.icon.value = icons.indexOf(icon);
          },
          childBuilder: (icon) {
            return Icon(icon);
          },
        );
      }),
    );
  }

  Widget _colorSelector() {
    const colors = VoclyColor.children;

    return SliverToBoxAdapter(
      child: Obx(() {
        final selectedIndex = controller.color.value;

        return PropertySelector<Color>(
          title: 'Color',
          properties: colors,
          selectedProperty: colors[selectedIndex],
          onSelected: (color) {
            controller.color.value = colors.indexOf(color);
          },
          childBuilder: (color) {
            return Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            );
          },
        );
      }),
    );
  }

  Widget _actionButtons() {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              icon: Icons.done_outlined,
              title: _isEditing ? 'Update word' : 'Add word',
              borderColor: UiColor.positiveColor,
              onTap: _submit,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: _ActionButton(
              icon: Icons.cancel_outlined,
              title: 'Cancel',
              borderColor: UiColor.errorColor,
              onTap: controller.goBack,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    _unfocus();
    final formState = controller.formKey.currentState;
    if (formState == null || !formState.validate()) {
      return;
    }
    final result = _isEditing
        ? await controller.updateWord()
        : await controller.addWord();
    result.fold(
      (error) {
        Get.showSnackbar(VoclySnackbar(message: error));
      },
      (success) {
        Get.back();
        Get.showSnackbar(VoclySnackbar(message: success));
      },
    );
  }

  void _unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: VoclyTypography.titleMedium);
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color borderColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.title,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: VoclyCard(
        height: 70,
        borderColor: borderColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Text(title, style: VoclyTypography.titleMedium),
          ],
        ),
      ),
    );
  }
}
