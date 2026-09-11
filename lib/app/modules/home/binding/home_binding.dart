import 'package:get/get.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/service/speech_service.dart';
import 'package:vocly/app/data/repository/repository.dart';
import 'package:vocly/app/modules/home/controller/book_crud_controller.dart';
import 'package:vocly/app/modules/home/controller/search_controller.dart';
import 'package:vocly/app/modules/home/controller/word_crud_controller.dart';
import 'package:vocly/app/modules/home/controller/word_details_controller.dart';
import 'package:vocly/app/modules/home/controller/word_manage_controller.dart';

class WordSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      return WordSearchController(Get.find<WordRepository>());
    });
  }
}

class WordManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      final type = Get.arguments['type'];
      return WordManageController(
        type,
        Get.find<WordRepository>(),
        Get.find<DialogService>(),
      );
    });
  }
}

class WordCrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      final id = Get.arguments['id'];
      final type = Get.arguments['type'];
      return WordCrudController(
        id,
        type,
        Get.find<WordRepository>(),
        Get.find<DialogService>(),
      );
    });
  }
}

class BookCrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      final id = Get.arguments['id'];
      final type = Get.arguments['type'];
      return BookCrudController(
        id,
        type,
        Get.find<BookRepository>(),
        Get.find<DialogService>(),
      );
    });
  }
}

class WordDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final id = Get.arguments['id'];
    Get.lazyPut(() {
      return WordDetailsController(
        id,
        Get.find<DialogService>(),
        Get.find<SpeechService>(),
        Get.find<WordRepository>(),
      );
    });
  }
}
