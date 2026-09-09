import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vocly/app/modules/exam/exam_page.dart';
import 'package:vocly/app/modules/home/view/home_page.dart';
import 'package:vocly/app/modules/practice/practice_page.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/shell/shell_controller.dart';

class VoclyShell extends GetView<ShellController> {
  const VoclyShell({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        controller.onBackPressed();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Obx(() {
                final index = controller.selectedPageIndex;
                return IndexedStack(
                  index: index,
                  children: const [HomePage(), PracticePage(), ExamPage()],
                );
              }),
            ),
          ),
        ),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends GetView<ShellController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final index = controller.selectedPageIndex;
      return SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: UiColor.backgroundColor2)),
          ),
          height: 100,
          child: BottomNavigationBar(
            onTap: (index) {
              controller.changeScreen(index: index);
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(index == 0 ? Icons.home : Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Practice',
                icon: Icon(index == 1 ? Icons.school : Icons.school_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Examp',
                icon: Icon(
                  index == 2 ? Icons.assignment : Icons.assignment_outlined,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
