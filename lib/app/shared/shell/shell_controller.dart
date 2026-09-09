import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ShellController extends GetxController {
  DateTime? _lastBackPressTime;

  // --- state
  final RxInt _selectedPageIndex = 0.obs;
  int get selectedPageIndex => _selectedPageIndex.value;

  void changeScreen({required int index}) {
    _selectedPageIndex.value = index;
  }

  // --- exit wrapper
  void onBackPressed() {
    final now = DateTime.now();
    const maxDuration = Duration(seconds: 2);

    final isWarning =
        _lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > maxDuration;

    if (isWarning) {
      _lastBackPressTime = now;
      return;
    }
    SystemNavigator.pop();
  }
}
