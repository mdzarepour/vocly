import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';

class VoclySnackbar extends GetSnackBar {
  VoclySnackbar({
    super.key,
    Duration duration = const Duration(seconds: 2),
    required String message,
    String? title,
  }) : super(
         snackPosition: SnackPosition.BOTTOM,
         snackStyle: SnackStyle.FLOATING,
         backgroundColor: const Color(0xFF323232),
         titleText: Text(title ?? '', style: VoclyTypography.bodyMedium),
         messageText: Text(message, style: VoclyTypography.bodySmall),
         borderWidth: 1,
         borderColor: UiColor.backgroundColor2,
         margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
         borderRadius: 12,
         forwardAnimationCurve: Curves.ease,
         reverseAnimationCurve: Curves.ease,
         duration: duration,
         dismissDirection: DismissDirection.horizontal,
       );
}
