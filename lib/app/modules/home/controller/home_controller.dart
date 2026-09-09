import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:vocly/app/core/enum/enum/enums.dart';
import 'package:vocly/app/core/router/pages.dart';

class HomeController extends GetxController {
  // --- navigation 
  void toWordManagePage() {
    Get.toNamed(Pages.wordManagePage);
  }

  void toWordCrudPage() {
    Get.toNamed(
      Pages.wordCrudPage,
      arguments: {'type': WordScreenType.addBook},
    );
  }

  void toSearchPage() {
    Get.toNamed(Pages.searchPage);
  }
}
