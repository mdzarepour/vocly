import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';

class FilterBottomSheet<T> extends StatelessWidget {
  // list of filter items
  final List<T> options;
  // returns whether a given item is currently selected (reads Rx state live)
  final bool Function(T value) isSelected;
  // select or deselect filter item
  final void Function(T value) onTap;
  // apply selected filter
  final void Function() onApply;
  // get specific widget for color and icon
  final Widget Function(T value)? itemBuilder;

  const FilterBottomSheet({
    super.key,
    required this.options,
    required this.isSelected,
    required this.onTap,
    required this.onApply,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //  Dragger
            Container(
              height: 5,
              width: 80,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: UiColor.thirdColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 8),
            Obx(() {
              return Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (var o in options)
                      _FilterItem<T>(
                        key: ValueKey(o),
                        value: o,
                        isSelected: isSelected(o),
                        itemBuilder: itemBuilder,
                        onTap: () => onTap(o),
                      ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 5),
            // Button
            InkWell(
              onTap: () {
                onApply();
                Get.back();
              },
              child: const VoclyCard(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(Icons.done_all_outlined),
                    Text('Apply filters', style: VoclyTypography.titleMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _FilterItem<T> extends StatelessWidget {
  final T value;
  final bool isSelected;
  final Widget Function(T value)? itemBuilder;
  final VoidCallback onTap;

  const _FilterItem({
    super.key,
    required this.value,
    required this.isSelected,
    required this.itemBuilder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dynamic
            if (itemBuilder != null)
              SizedBox(width: 28, child: Center(child: itemBuilder!(value))),
            // Name
            if (itemBuilder == null)
              Expanded(
                child: Text(
                  (value as Enum).name.capitalizeFirst!,
                  style: VoclyTypography.bodyMedium,
                ),
              ),
            // Checkbox
            SizedBox(
              width: 22,
              child: Checkbox(
                value: isSelected,
                onChanged: (value) => onTap(),
                checkColor: UiColor.thirdColor,
                activeColor: UiColor.backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
