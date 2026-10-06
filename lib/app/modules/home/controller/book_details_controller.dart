import 'dart:async';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/data/model/book.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/repository.dart';
import 'package:vocly/app/shared/state/pagination_state.dart';

class BookDetailsController extends GetxController {
  final BookRepository _bookRepository;
  final int id;

  BookDetailsController(this._bookRepository, this.id);

  StreamSubscription<Book?>? _bookStream;
  late final PaginationState paginator;

  final Rxn<Book> _book = Rxn<Book>();
  Book? get book => _book.value;

  final RxList<Word> _words = <Word>[].obs;
  List<Word> get words => _words;

  final Rx<LoadingStatus> _loading = Rx(LoadingStatus.init);
  LoadingStatus get isLoading => _loading.value;

  /// Incremented on every refresh so results of an outdated fetch are ignored.
  int _generation = 0;

  Future<void> toBookCrudPage() async {
    await Get.toNamed(
      Pages.bookCrudPage,
      arguments: {'id': id, 'type': CrudScreenType.edit},
    );
    await _setBook(await _bookRepository.getBook(id: id));
    await refreshWords();
  }

  Future<void> toWordDetailsPage({required int id}) async {
    await Get.toNamed(Pages.wordDetailsPage, arguments: {'id': id});
    await refreshWords();
  }

  Future<void> _setBook(Book? book) async {
    await book?.words.load();
    _book.value = book;
  }

  Future<void> fetchWords() async {
    if (_loading.value == LoadingStatus.working) return;

    final generation = _generation;
    if (_loading.value != LoadingStatus.init) {
      _loading.value = LoadingStatus.working;
    }
    try {
      await paginator.fetchNextPage<Word>(
        fetcher: (limit, offset) => _bookRepository.getBookWordsPage(
          bookId: id,
          offset: offset,
          limit: limit,
        ),
        onSuccess: (value) {
          if (generation == _generation) _words.addAll(value);
        },
        listLength: words.length,
      );
    } finally {
      if (generation == _generation) _loading.value = LoadingStatus.none;
    }
  }

  Future<void> refreshWords() {
    _generation++;
    _words.clear();
    paginator.reset();
    _loading.value = LoadingStatus.none; // allow a new fetch immediately
    return fetchWords();
  }

  Future<void> _initialize() async {
    await _setBook(await _bookRepository.getBook(id: id));
    await fetchWords();
    _bookStream = _bookRepository.watchBook(id: id).listen(_setBook);
  }

  @override
  void onInit() {
    super.onInit();
    paginator = PaginationState();
    _initialize();
  }

  @override
  void onClose() {
    _bookStream?.cancel();
    super.onClose();
  }
}
