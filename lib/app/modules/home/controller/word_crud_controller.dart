import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/error/vocly_error.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/repository.dart';

class WordCrudController extends GetxController {
  final WordRepository _wordRepository;
  final DialogService _dialogService;
  final CrudScreenType screenType;
  final int? _id;

  WordCrudController(
    this._id,
    this.screenType,
    this._wordRepository,
    this._dialogService,
  );

  late final TextEditingController nameController;
  late final TextEditingController meaningController;
  late final TextEditingController exampleController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Word? _editingWord;

  Rx<WordType> type = Rx(WordType.noun);
  Rx<WordLevel> level = Rx(WordLevel.easy);
  RxInt icon = 0.obs;
  RxInt color = 0.obs;

  Future<void> _initController() async {
    if (screenType == CrudScreenType.add) return;
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

  Future<Either<String, String>> addWord() async {
    try {
      final newWord = Word.fromMap(map: _createMap());
      final isExist = await _wordRepository.isWordExist(name: newWord.name);
      if (isExist) {
        final permission = await _dialogService.showDialog(
          title: "You are already have this word!",
          content: "Do you want to add twice?",
          confirmTitle: "Confirm",
        );
        if (!permission) {
          return left("Permission denied");
        }
      }
      await _wordRepository.addWord(word: newWord);
      return right("${newWord.name.capitalizeFirst} added");
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  Future<Either<String, String>> updateWord() async {
    try {
      final map = _createMap();
      _editingWord!.updateWord(
        newColor: map["color"] as int,
        newExample: map["example"] as String,
        newIcon: map["icon"] as int,
        newLevel: map["level"] as WordLevel,
        newMeaning: map["meaning"] as String,
        newName: map["name"] as String,
        newType: map["type"] as WordType,
      );
      await _wordRepository.updateWord(word: _editingWord!);
      return right("${_editingWord!.name} updated");
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  Map<String, dynamic> _createMap() {
    return {
      "name": nameController.text,
      "meaning": meaningController.text,
      "example": exampleController.text,
      "type": type.value,
      "level": level.value,
      "icon": icon.value,
      "color": color.value,
      "isLearned": false,
    };
  }

  void goBack() {
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    meaningController = TextEditingController();
    exampleController = TextEditingController();
    _initController();
  }

  @override
  void onClose() {
    nameController.dispose();
    meaningController.dispose();
    exampleController.dispose();
    super.onClose();
  }
}
