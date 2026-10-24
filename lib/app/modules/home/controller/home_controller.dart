import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/error/vocly_error.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/core/service/luncher_service.dart';
import 'package:vocly/app/core/service/platform_service.dart';
import 'package:vocly/app/data/repository/repository.dart';

class HomeController extends GetxController {
  final WordRepository wordRepository;
  final LuncherService _luncherService;
  final PlatformService _platformService;

  HomeController(
    this._luncherService,
    this._platformService,
    this.wordRepository,
  );

  Future<Either<String, String>> exportWords() async {
    try {
      final Uint8List bytes = await wordRepository.exportWords();
      final result = await _platformService.saveBackupFile(bytes: bytes);
      if (result == null) {
        return left('Faild! please try again');
      }
      return right("Backup saved Successfully");
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  void goToPreparedBooksWebPage() {
    _luncherService.lunchPreparedBooksWebPage();
  }

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
