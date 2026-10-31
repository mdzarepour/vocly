import 'dart:async';
import 'dart:convert';
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
  final BookRepository _bookRepository;
  final WordRepository _wordRepository;
  final LuncherService _luncherService;
  final PlatformService _platformService;

  HomeController(
    this._luncherService,
    this._platformService,
    this._wordRepository,
    this._bookRepository,
  );

  final Rx<BackupLoading> _loading = Rx(BackupLoading.none);
  BackupLoading get loading => _loading.value;

  final RxInt _wordsCout = RxInt(0);
  int get wordsCount => _wordsCout.value;

  final RxInt _booksCout = RxInt(0);
  int get booksCount => _booksCout.value;

  late final StreamSubscription _bookSubscription;
  late final StreamSubscription _wordSubscription;

  Future<Either<String, String>> exportWords() async {
    _loading.value = BackupLoading.exportLoading;
    try {
      final Uint8List bytes = await _wordRepository.exportWords();
      final result = await _platformService.saveBackupFile(bytes: bytes);
      if (result == null) {
        return left("Faild! please try again");
      }
      return right("Backup saved Successfully");
    } on AppError catch (e) {
      return left(e.errorMessage);
    } finally {
      _loading.value = BackupLoading.none;
    }
  }

  Future<Either<String, String>> importWords() async {
    _loading.value = BackupLoading.importLoading;
    try {
      final bytes = await _platformService.getBackupFile();
      if (bytes != null) {
        await _wordRepository.importWords(data: utf8.decode(bytes));
        return right("File imported successfully");
      }
      return left("Fail to import!");
    } on AppError catch (e) {
      return left(e.errorMessage);
    } finally {
      _loading.value = BackupLoading.none;
    }
  }

  void goToPreparedBooksWebPage() {
    _luncherService.lunchPreparedBooksWebPage();
  }

  void toWordManagePage() {
    Get.toNamed(
      Pages.wordManagePage,
      arguments: {"type": WordManagerScreenType.manageWords},
    );
  }

  void toBookManagePage() {
    Get.toNamed(Pages.bookManagePage);
  }

  void toWordCrudPage() {
    Get.toNamed(Pages.wordCrudPage, arguments: {"type": CrudScreenType.add});
  }

  void toBookCrudPage() {
    Get.toNamed(Pages.bookCrudPage, arguments: {"type": CrudScreenType.add});
  }

  void toSearchPage() {
    Get.toNamed(Pages.searchPage);
  }

  @override
  void onInit() {
    super.onInit();
    _wordSubscription = _wordRepository.watchWordsCount().listen((value) {
      _wordsCout.value = value;
    });
    _bookSubscription = _bookRepository.watchBooksCount().listen((value) {
      _booksCout.value = value;
    });
  }

  @override
  void onClose() {
    _wordSubscription.cancel();
    _bookSubscription.cancel();
    super.onClose();
  }
}
