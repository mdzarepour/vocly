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

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;

  /// Completes when the editing book (and its words) is fully loaded.
  /// Submitting must wait for it, otherwise an empty word list would be saved.
  late final Future<void> ready;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Book? _editingBook;

  final RxList<int> _wordsIds = <int>[].obs;
  final Rx<BookType> type = Rx(BookType.academic);
  final Rx<BookLevel> level = Rx(BookLevel.easy);
  final RxInt icon = 0.obs;
  final RxInt color = 0.obs;

  Future<void> _initController() async {
    if (screenType == CrudScreenType.add) return;

    final book = await _bookRepository.getBook(id: _id!);
    if (book == null) return;

    await book.words.load();
    _editingBook = book;
    _wordsIds.assignAll(book.words.map((word) => word.id));
    nameController.text = book.name;
    descriptionController.text = book.description;
    type.value = book.type;
    level.value = book.level;
    icon.value = book.icon;
    color.value = book.color;
  }

  Future<Either<String, String>> addWord() async {
    await ready;
    try {
      final newBook = Book.create(map: _createMap());
      final isExist = await _bookRepository.isBookExist(name: newBook.name);
      if (isExist) {
        final permission = await _dialogService.showDialog(
          title: 'You already have this book!',
          content: 'Do you want to add it twice?',
          confirmTitle: 'Confirm',
        );
        if (!permission) return left('Permission denied');
      }
      await _bookRepository.addBook(book: newBook, ids: _wordsIds.toList());
      return right('${newBook.name.capitalizeFirst} added');
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  Future<Either<String, String>> updateWord() async {
    await ready;
    final book = _editingBook;
    if (book == null) return left('Book could not be loaded');

    try {
      final map = _createMap();
      book.updateBook(
        newColor: map['color'],
        newDescription: map['description'],
        newIcon: map['icon'],
        newLevel: map['level'],
        newName: map['name'],
        newType: map['type'],
      );
      await _bookRepository.updateBook(book: book, ids: _wordsIds.toList());
      return right('${book.name} updated');
    } on AppError catch (e) {
      return left(e.errorMessage);
    }
  }

  Map<String, dynamic> _createMap() => {
    'name': nameController.text,
    'description': descriptionController.text,
    'type': type.value,
    'level': level.value,
    'icon': icon.value,
    'color': color.value,
    'isLearned': false,
  };

  void goBack() => Get.back();

  Future<void> toManageWordsPage() async {
    await ready;
    final selectedIds = await Get.toNamed(
      Pages.wordManagePage,
      arguments: {
        'type': WordManagerScreenType.selectWords,
        'selectedIds': _wordsIds.toList(),
      },
    );
    if (selectedIds != null) {
      _wordsIds.assignAll(List<int>.from(selectedIds));
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    ready = _initController();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
