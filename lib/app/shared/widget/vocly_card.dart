import 'package:flutter/material.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';

class VoclyCard extends StatelessWidget {
  final Widget child;
  final bool? withPadding;
  final double? height;
  final Color? borderColor;

  const VoclyCard({
    super.key,
    this.height,
    this.withPadding,
    this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: withPadding == false
          ? null
          : const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: UiColor.forthColor,
        border: Border.all(color: borderColor ?? UiColor.backgroundColor2),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(child: child),
    );
  }
}
