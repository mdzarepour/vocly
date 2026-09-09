import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/error/vocly_error.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/enum/enum/enums.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/word_repository.dart';

class WordCrudController extends GetxController {
  final WordRepository _wordRepository;
  final DialogService _dialogService;
  final WordScreenType screenType;
  final int? _id;

  WordCrudController(
    this._id,
    this.screenType,
    this._wordRepository,
    this._dialogService,
  );

  // --- form
  late final TextEditingController nameController;
  late final TextEditingController meaningController;
  late final TextEditingController exampleController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Word? _editingWord;

  // --- state
  Rx<WordType> type = Rx(WordType.noun);
  Rx<WordLevel> level = Rx(WordLevel.easy);
  RxInt icon = 0.obs;
  RxInt color = 0.obs;

  // --- init controller
  void _initController() async {
    if (screenType == WordScreenType.addBook) return;
    _editingWord = await _wordRepository.getWord(id: _id!);

    if (_editingWord != null) {
      nameController.text = _editingWord!.name;
      meaningController.text = _editingWord!.meaning;
      exampleController.text = _editingWord!.example;

      type.value = _editingWord!.type;
      level.value = _editingWord!.level;
      icon.value = _editingWord!.icon;
      color.value = _editingWord!.color;
    }
  }

  // --- add word
  Future<Either<String, String>> addWord() async {
    try {
      final newWord = Word.create(map: _ctreateMap());
      final isExist = await _wordRepository.isWordExist(name: newWord.name);
      if (isExist) {
        final permission = await _dialogService.showDialog(
          title: 'You are already have this word!',
          content: 'Do you want to add twice?',
          confirmTitle: 'Confirm',
        );
        if (!permission) {
          return left('Permission denied');
        }
      }
      await _wordRepository.addWord(word: newWord);
      return right('${newWord.name.capitalizeFirst} added');
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  // --- update word
  Future<Either<String, String>> updateWord() async {
    try {
      final map = _ctreateMap();
      _editingWord!.updateWord(
        newColor: map['color'],
        newExample: map['example'],
        newIcon: map['icon'],
        newLevel: map['level'],
        newMeaning: map['meaning'],
        newName: map['name'],
        newType: map['type'],
      );
      await _wordRepository.updateWord(word: _editingWord!);
      return right('${_editingWord!.name} updated');
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  // --- helpers
  Map<String, dynamic> _ctreateMap() {
    return {
      'name': nameController.text,
      'meaning': meaningController.text,
      'example': exampleController.text,
      'type': type.value,
      'level': level.value,
      'icon': icon.value,
      'color': color.value,
      'isLearned': false,
    };
  }

  // --- navigation
  void goBack() {
    Get.back();
  }

  // --- life cycle
  @override
  void onInit() {
    super.onInit();
    _initController();
    nameController = TextEditingController();
    meaningController = TextEditingController();
    exampleController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    meaningController.dispose();
    exampleController.dispose();
  }
}
