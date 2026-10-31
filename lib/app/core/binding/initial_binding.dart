import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/service/luncher_service.dart';
import 'package:vocly/app/core/service/platform_service.dart';
import 'package:vocly/app/core/service/speech_service.dart';
import 'package:vocly/app/data/provider/book_provider.dart';
import 'package:vocly/app/data/provider/word_provider.dart';
import 'package:vocly/app/data/repository/repository.dart';
import 'package:vocly/app/modules/home/controller/home_controller.dart';
import 'package:vocly/app/shared/shell/shell_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    final repository = Repository(
      Get.find<BookProvider>(),
      Get.find<WordProvider>(),
    );
    Get.put<WordRepository>(repository, permanent: true);
    Get.put<BookRepository>(repository, permanent: true);

    Get.lazyPut(() => SpeechService(flutterTts: FlutterTts()), fenix: true);
    Get.lazyPut(() => PlatformService(), fenix: true);
    Get.lazyPut(() => LuncherService(), fenix: true);
    Get.lazyPut(() => DialogService(), fenix: true);

    Get.lazyPut(() => ShellController(), fenix: true);
    Get.lazyPut(
      () => HomeController(
        Get.find<LuncherService>(),
        Get.find<PlatformService>(),
        Get.find<WordRepository>(),
        Get.find<BookRepository>(),
      ),
    );
  }
}
