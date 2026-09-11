import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';

class SortBottomSheet extends StatelessWidget {
  final bool Function(SortType value) isSelected;
  final void Function(SortType value) onTap;
  final void Function() onApply;

  const SortBottomSheet({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.onApply,
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
                    for (int i = 0; i < SortType.values.length - 1; i++)
                      _SortItem(
                        key: ValueKey(SortType.values[i]),
                        value: SortType.values[i],
                        isSelected: isSelected(SortType.values[i]),
                        onTap: () => onTap(SortType.values[i]),
                      ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 5),
            // Button
            InkWell(
              onTap: onApply,
              child: const VoclyCard(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(Icons.done_all_outlined),
                    Text('Apply Sort', style: VoclyTypography.titleMedium),
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

class _SortItem extends StatelessWidget {
  final Enum value;
  final bool isSelected;
  final VoidCallback onTap;

  const _SortItem({
    super.key,
    required this.value,
    required this.isSelected,
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
            Expanded(
              child: Text(value.name, style: VoclyTypography.bodyMedium),
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
