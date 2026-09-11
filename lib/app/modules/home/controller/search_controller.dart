import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/shared/state/pagination_state.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/repository.dart';

class WordSearchController extends GetxController {
  final WordRepository _wordRepository;
  WordSearchController(this._wordRepository);

  late final PaginationState paginator;

  final RxList<Word> _words = <Word>[].obs;
  List<Word> get words => _words;

  // --- state
  final RxString _query = ''.obs;
  String get query => _query.value;

  final Rx<LoadingStatus> _loading = Rx(LoadingStatus.init);
  LoadingStatus get loading => _loading.value;

  void updateQuery({required String q}) {
    _query.value = q;
  }

  // --- search
  Future<void> search() async {
    if (_loading.value == LoadingStatus.working) {
      return;
    }
    if (_loading.value != LoadingStatus.init) {
      _loading.value = LoadingStatus.working;
    }
    paginator.reset();
    try {
      final result = await _wordRepository.searchWords(
        limit: paginator.pageSize,
        offset: 0,
        query: _query.value,
      );
      paginator.updateHasMore(length: result.length);
      _words.assignAll(result);
    } finally {
      _loading.value = LoadingStatus.none;
    }
  }

  // --- load more
  Future<void> loadMore() async {
    await paginator.fetchNextPage<Word>(
      fetcher: (limit, offset) {
        return _wordRepository.searchWords(
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
