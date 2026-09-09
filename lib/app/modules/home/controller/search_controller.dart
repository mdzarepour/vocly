import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enum/enums.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/core/state/pagination_state.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/word_repository.dart';

class WordSearchController extends GetxController {
  final WordRepository _wordRepository;
  WordSearchController(this._wordRepository);

  late final PaginationState paginator;

  final RxList<Word> _words = <Word>[].obs;
  List<Word> get words => _words;

  // --- state 
  final RxString _query = ''.obs;
  String get query => _query.value;

  final Rx<SearchLoading> _loading = Rx(SearchLoading.init);
  SearchLoading get loading => _loading.value;

  void updateQuery({required String q}) {
    _query.value = q;
  }

  // --- search 
  Future<void> search() async {
    if (_loading.value == SearchLoading.search) {
      return;
    }
    if (_loading.value != SearchLoading.init) {
      _loading.value = SearchLoading.search;
    }
    paginator.reset();
    try {
      final result = await _wordRepository.wordProvider.searchWords(
        limit: paginator.pageSize,
        offset: 0,
        query: _query.value,
      );
      paginator.updateHasMore(length: result.length);
      _words.assignAll(result);
    } finally {
      _loading.value = SearchLoading.none;
    }
  }

  // --- load more 
  Future<void> loadMore() async {
    await paginator.fetchNextPage<Word>(
      fetcher: (limit, offset) {
        return _wordRepository.wordProvider.searchWords(
          limit: limit,
          offset: offset,
          query: _query.value,
        );
      },
      onSuccess: (value) {
        _words.addAll(value);
      },
      listLength: _words.length,
    );
  }

  // --- navigation
  void toWordDetailsPage({required int id}) {
    Get.toNamed(Pages.wordDetailsPage, arguments: {'id': id});
  }

  // --- life cycle
  @override
  void onInit() {
    super.onInit();
    paginator = PaginationState();
    ever(_query, (_) => search());
    search();
  }
}
