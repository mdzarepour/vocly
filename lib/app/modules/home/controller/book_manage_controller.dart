import 'dart:async';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/data/model/book.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/repository.dart';
import 'package:vocly/app/shared/state/pagination_state.dart';
import 'package:vocly/app/shared/state/selection_state.dart';

class BookManageController extends GetxController {
  final BookRepository _bookRepository;
  final DialogService _dialogService;

  BookManageController(this._bookRepository, this._dialogService);

  late final StreamSubscription subscription;
  late final PaginationState paginator;
  late final SelectionState bookSelection;

  // --- state
  final RxList<Book> _books = <Book>[].obs;
  List<Book> get books => _books;

  final Rx<LoadingStatus> _loading = Rx(LoadingStatus.init);
  LoadingStatus get isLoading => _loading.value;

  // --- fetch
  Future<void> fetchWords() async {
    if (_loading.value == LoadingStatus.working) {
      return;
    }
    if (_loading.value != LoadingStatus.init) {
      _loading.value = LoadingStatus.working;
    }
    try {
      await paginator.fetchNextPage<Book>(
        fetcher: (limit, offset) async {
          await Future.delayed(const Duration(milliseconds: 350));
          return _bookRepository.getBooksPage(offset: offset, limit: limit);
        },
        onSuccess: (value) {
          _books.addAll(value);
        },
        listLength: _books.length,
      );
    } finally {
      _loading.value = LoadingStatus.none;
    }
  }

  // --- delete
  Future<void> deleteSelectedWords() async {
    final permission = await _dialogService.showDialog(
      title: 'Deleting',
      content: 'Are you sure about deleting books',
      confirmTitle: 'Delete',
    );
    if (!permission) {
      return;
    }
    final ids = bookSelection.selectedIds.toList();
    if (ids.isEmpty) {
      return;
    }
    await _bookRepository.deleteBooks(ids: ids);
    bookSelection.clear();
  }

  Future<void> refreshPage() async {
    _books.clear();
    paginator.reset();
    await fetchWords();
  }

  // --- navigation
  // void toWordDetailsPage({required int id}) {
  //   Get.toNamed(Pages.wordDetailsPage, arguments: {'id': id});
  // }

  void toBackWithSelectedWords() {
    Get.back(result: bookSelection.selectedIds);
  }

  void toBack() {
    Get.back();
  }

  // --- life cycle
  @override
  void onInit() {
    bookSelection = SelectionState<Book>(idOf: (item) => item.id);
    paginator = PaginationState();
    subscription = _bookRepository.watchBooks().listen((event) {
      refreshPage();
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    subscription.cancel();
  }
}
