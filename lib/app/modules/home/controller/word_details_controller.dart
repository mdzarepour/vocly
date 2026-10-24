import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/error/vocly_error.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/service/speech_service.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/repository.dart';
import 'package:vocly/app/shared/state/spelling_state.dart';

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

  StreamSubscription<Word?>? _wordStream;
  SpellingState? spellingState;

  final Rxn<Word> _word = Rxn<Word>();
  Word? get word => _word.value;

  Future<void> listenToWord() async {
    if (_word.value == null) return;
    await _speechService.speak(text: _word.value!.name);
  }

  Future<Either<String, String>?> deleteWord() async {
    final confirmed = await _dialogService.showDialog(
      title: "Delete word?",
      content: "Are you sure you want to delete ${_word.value!.name}?",
      confirmTitle: "Delete",
    );
    if (!confirmed) {
      return null;
    }
    try {
      await _wordRepository.deleteWords(ids: [_word.value!.id]);
      return right("${_word.value!.name} deleted");
    } on AppError catch (error) {
      return left(error.errorMessage);
    } catch (error) {
      return left(error.toString());
    }
  }

  void toWordCrudPage() {
    Get.toNamed(
      Pages.wordCrudPage,
      arguments: {"id": id, "type": CrudScreenType.edit},
    );
  }

  void toBack() {
    Get.back();
  }

  Future<void> _initWord() async {
    final result = await _wordRepository.getWord(id: id);
    _refreshWord(result);
  }

  void _initStream() {
    _wordStream = _wordRepository.watchWord(id: id).listen((event) {
      _refreshWord(event);
    });
  }

  void _refreshWord(Word? word) {
    _word.value = word;
    if (word == null) {
      spellingState = null;
    } else if (spellingState?.word != word.name) {
      spellingState = SpellingState(word: word.name);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    await _initWord();
    _initStream();
  }

  @override
  void onClose() {
    _wordStream?.cancel();
    super.onClose();
  }
}
