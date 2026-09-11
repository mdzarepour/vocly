import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/modules/home/controller/book_crud_controller.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/property_selector.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';
import 'package:vocly/app/shared/widget/vocly_input.dart';
import 'package:vocly/app/shared/widget/vocly_snackbar.dart';

class BookCrudPage extends GetView<BookCrudController> {
  const BookCrudPage({super.key});

  bool get _isEditing => controller.screenType != CrudScreenType.add;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocus,
      child: Scaffold(
        // Appbar
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            _isEditing ? 'Edit book' : 'Add new book',
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
                // Title
                const SliverToBoxAdapter(
                  child: Text(
                    'Book details',
                    style: VoclyTypography.titleMedium,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                // Name input
                SliverToBoxAdapter(
                  child: VoclyInput(
                    controller: controller.nameController,
                    icon: Icons.language_outlined,
                    hint: 'Name',
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // Description input
                SliverToBoxAdapter(
                  child: VoclyInput(
                    controller: controller.descriptionController,
                    icon: Icons.lightbulb_outline,
                    hint: 'Description',
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // Type
                _typeSelector(),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // Level
                _levelSelector(),
                const SliverToBoxAdapter(child: SizedBox(height: 25)),
                // Title
                const SliverToBoxAdapter(
                  child: Text(
                    'Word visual',
                    style: VoclyTypography.titleMedium,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // Book words
                _selectWords(),
                const SliverToBoxAdapter(child: SizedBox(height: 25)),
                // Title
                const SliverToBoxAdapter(
                  child: Text(
                    'Word visual',
                    style: VoclyTypography.titleMedium,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // Icon
                _iconSelector(),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                // Color
                _colorSelector(),
                const SliverToBoxAdapter(child: SizedBox(height: 25)),
                // Buuttons
                _actionButtons(),
                const SliverToBoxAdapter(child: SizedBox(height: 30)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _selectWords() {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: controller.toManageWordsPage,
        child: const VoclyCard(
          height: 50,
          child: Text(style: VoclyTypography.titleMedium, 'Words'),
        ),
      ),
    );
  }

  Widget _typeSelector() {
    return SliverToBoxAdapter(
      child: Obx(() {
        return PropertySelector<BookType>(
          title: 'Type',
          properties: BookType.values,
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
        return PropertySelector<BookLevel>(
          title: 'Level',
          properties: BookLevel.values,
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
            // Apply button
            child: _ActionButton(
              icon: Icons.done_outlined,
              title: _isEditing ? 'Update book' : 'Add book',
              borderColor: UiColor.positiveColor,
              onTap: _submit,
            ),
          ),
          const SizedBox(width: 15),
          // Cancel button
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
