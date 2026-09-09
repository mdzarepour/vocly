import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enum/enums.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/service/speech_service.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/word_repository.dart';

class WordDetailsController extends GetxController {
  final WordRepository _wordRepository;
  final DialogService _dialogService;
  final SpeechService _speechService;
  final int id;

  WordDetailsController(
    this.id,
    this._dialogService,
    this._speechService,
    this._wordRepository,
  );

  late final StreamSubscription<Word?>? wordStream;

  // --- state
  final Rxn<Word> _word = Rxn<Word>();
  Word? get word => _word.value;

  void listenToWord() {}

  Future<Either<String, String>> deleteWord() async {
    try {
      return right('asdas');
    } catch (e) {
      return left('dsfjhsdgf');
    }
  }

  // --- navigation
  void toWordCrudPage() {
    Get.toNamed(
      Pages.wordCrudPage,
      arguments: {'id': id, 'type': WordScreenType.editBook},
    );
  }

  void toBack() {
    Get.back();
  }

  // --- life cycle
  Future<void> _initWord() async {
    final Word? word = await _wordRepository.getWord(id: id);
    _word.value = word;
  }

  void _initStream() {
    wordStream = _wordRepository.watchWord(id: id).listen((event) {
      _word.value = event;
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await _initWord();
    _initStream();
  }

  @override
  void onClose() {
    wordStream?.cancel();
    super.onClose();
  }
}
