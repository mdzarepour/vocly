import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/error/vocly_error.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/data/model/book.dart';
import 'package:vocly/app/data/repository/repository.dart';

class BookCrudController extends GetxController {
  final BookRepository _bookRepository;
  final DialogService _dialogService;
  final CrudScreenType screenType;
  final int? _id;

  BookCrudController(
    this._id,
    this.screenType,
    this._bookRepository,
    this._dialogService,
  );

  // --- form
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Book? _editingBook;

  // --- state
  final RxList<int> _wordsIds = <int>[].obs;
  Rx<BookType> type = Rx(BookType.academic);
  Rx<BookLevel> level = Rx(BookLevel.easy);
  RxInt icon = 0.obs;
  RxInt color = 0.obs;

  // --- init controller
  void _initController() async {
    if (screenType == CrudScreenType.add) return;
    _editingBook = await _bookRepository.getBook(id: _id!);

    if (_editingBook != null) {
      nameController.text = _editingBook!.name;
      descriptionController.text = _editingBook!.description;

      type.value = _editingBook!.type;
      level.value = _editingBook!.level;
      icon.value = _editingBook!.icon;
      color.value = _editingBook!.color;
    }
  }

  // --- add word
  Future<Either<String, String>> addWord() async {
    try {
      final newWord = Book.create(map: _ctreateMap());
      final isExist = await _bookRepository.isBookExist(name: newWord.name);
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
      await _bookRepository.addBook(book: newWord, ids: _wordsIds);
      return right('${newWord.name.capitalizeFirst} added');
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  // --- update word
  Future<Either<String, String>> updateWord() async {
    try {
      final map = _ctreateMap();
      _editingBook!.updateBook(
        newColor: map['color'],
        newIcon: map['icon'],
        newLevel: map['level'],
        newName: map['name'],
        newType: map['type'],
      );
      await _bookRepository.updateBook(book: _editingBook!);
      return right('${_editingBook!.name} updated');
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  // --- helpers
  Map<String, dynamic> _ctreateMap() {
    return {
      'name': nameController.text,
      'description': descriptionController.text,
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

  void toManageWordsPage() async {
    _wordsIds.value = await Get.toNamed(
      Pages.wordManagePage,
      arguments: {'type': WordManagerScreenType.selectWords},
    );
  }

  // --- life cycle
  @override
  void onInit() {
    super.onInit();
    _initController();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    descriptionController.dispose();
  }
}
