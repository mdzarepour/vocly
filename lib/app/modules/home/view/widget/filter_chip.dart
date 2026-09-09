import 'package:flutter/material.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelectd;
  final void Function()? onTap;

  const FilterButton({
    required this.onTap,
    required this.isSelectd,
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: UiColor.newColor,
          border: Border.all(
            color: isSelectd ? UiColor.thirdColor : UiColor.backgroundColor2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            spacing: 10,
            children: [
              Icon(icon),
              Text(style: VoclyTypography.bodyMedium, title),
            ],
          ),
        ),
      ),
    );
  }
}
