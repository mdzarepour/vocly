import 'package:flutter/material.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';

class VoclyInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  const VoclyInput({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: UiColor.thirdColor,
      style: VoclyTypography.titleMedium,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please insert $hint';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: UiColor.forthColor,
        hintText: hint,
        suffixIcon: Icon(icon, color: UiColor.thirdColor),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: UiColor.backgroundColor2, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: UiColor.errorColor, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: UiColor.thirdColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: UiColor.thirdColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
