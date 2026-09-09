import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/service/speech_service.dart';
import 'package:vocly/app/data/provider/book_provider.dart';
import 'package:vocly/app/data/provider/word_provider.dart';
import 'package:vocly/app/data/repository/book_repository.dart';
import 'package:vocly/app/data/repository/word_repository.dart';
import 'package:vocly/app/modules/home/controller/home_controller.dart';
import 'package:vocly/app/shared/shell/shell_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WordRepository(wordProvider: Get.find<WordProvider>()),
      fenix: true,
    );

    Get.lazyPut(
      () => BookRepository(bookProvider: Get.find<BookProvider>()),
      fenix: true,
    );

    Get.lazyPut(() => SpeechService(flutterTts: FlutterTts()), fenix: true);

    Get.lazyPut(() => DialogService(), fenix: true);

    Get.lazyPut(() => ShellController(), fenix: true);

    Get.lazyPut(() => HomeController());
  }
}
