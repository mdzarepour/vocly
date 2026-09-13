import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/router/pages.dart';

class HomeController extends GetxController {
  // --- navigation
  void toWordManagePage() {
    Get.toNamed(
      Pages.wordManagePage,
      arguments: {'type': WordManagerScreenType.manageWords},
    );
  }

  void toBookManagePage() {
    Get.toNamed(Pages.bookManagePage);
  }

  void toWordCrudPage() {
    Get.toNamed(Pages.wordCrudPage, arguments: {'type': CrudScreenType.add});
  }

  void toBookCrudPage() {
    Get.toNamed(Pages.bookCrudPage, arguments: {'type': CrudScreenType.add});
  }

  void toSearchPage() {
    Get.toNamed(Pages.searchPage);
  }
}
