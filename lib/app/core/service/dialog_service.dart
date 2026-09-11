import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';

// TODO serach about seperating widget from service
class DialogService extends GetxService {
  Future<bool> showDialog({
    required String title,
    required String content,
    required String confirmTitle,
  }) async {
    final bool result = await Get.dialog(
      barrierColor: UiColor.backgroundColor,
      transitionCurve: Curves.easeIn,
      transitionDuration: const Duration(milliseconds: 100),
      useSafeArea: true,
      _DialogWidget(title: title, content: content, confirmTitle: confirmTitle),
    );
    return result;
  }
}

class _DialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final String confirmTitle;

  const _DialogWidget({
    required this.title,
    required this.content,
    required this.confirmTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        side: BorderSide(color: UiColor.backgroundColor2),
      ),
      backgroundColor: UiColor.forthColor,
      title: Text(title, style: VoclyTypography.titleLarge),
      content: Text(content, style: VoclyTypography.titleMedium),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Cancel Button
            Expanded(
              child: InkWell(
                onTap: () => Get.back(result: false),
                child: const VoclyCard(
                  height: 60,
                  child: Center(
                    child: Text('Cancel', style: VoclyTypography.titleMedium),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Confirm Button
            Expanded(
              child: InkWell(
                onTap: () => Get.back(result: true),
                child: VoclyCard(
                  height: 60,
                  child: Center(
                    child: Text(
                      confirmTitle,
                      style: VoclyTypography.titleMedium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
