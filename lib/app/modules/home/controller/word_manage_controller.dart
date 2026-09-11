import 'dart:async';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/core/state/filtering_state.dart';
import 'package:vocly/app/core/state/pagination_state.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/core/state/selection_state.dart';
import 'package:vocly/app/data/repository/repository.dart';

class WordManageController extends GetxController {
  final WordRepository _wordRepository;
  final DialogService _dialogService;
  final WordManagerScreenType type;

  WordManageController(this.type, this._wordRepository, this._dialogService);

  late final StreamSubscription subscription;
  late final PaginationState paginator;
  late final FilteringState filterState;
  late final SelectionState wordSelection;

  // --- state
  final RxList<Word> _words = <Word>[].obs;
  List<Word> get words => _words;

  final Rx<LoadingStatus> _loading = Rx(LoadingStatus.init);
  LoadingStatus get isLoading => _loading.value;

  final Rx<ScreenLayout> _layout = ScreenLayout.listView.obs;
  ScreenLayout get layout => _layout.value;

  void toggleLayout() {
    _layout.value = _layout.value == ScreenLayout.gridView
        ? ScreenLayout.listView
        : ScreenLayout.gridView;
  }

  // --- fetch
  Future<void> fetchWords() async {
    if (_loading.value == LoadingStatus.working) {
      return;
    }
    if (_loading.value != LoadingStatus.init) {
      _loading.value = LoadingStatus.working;
    }
    try {
      await paginator.fetchNextPage<Word>(
        fetcher: (limit, offset) async {
          await Future.delayed(const Duration(milliseconds: 350));
          return _wordRepository.getWordsPage(
            filter: filterState.filter,
            sort: filterState.sort,
            offset: offset,
            limit: limit,
          );
        },
        onSuccess: (value) {
          _words.addAll(value);
        },
        listLength: words.length,
      );
    } finally {
      _loading.value = LoadingStatus.none;
    }
  }

  // --- delete
  Future<void> deleteSelectedWords() async {
    final permission = await _dialogService.showDialog(
      title: 'Deleting',
      content: 'Are you sure about deleting words',
      confirmTitle: 'Delete',
    );
    if (!permission) {
      return;
    }
    final ids = wordSelection.selectedIds.toList();
    if (ids.isEmpty) {
      return;
    }
    await _wordRepository.deleteWords(ids: ids);
    wordSelection.clear();
  }

  Future<void> refreshPage() async {
    _words.clear();
    paginator.reset();
    await fetchWords();
  }

  // --- navigation
  void toWordDetailsPage({required int id}) {
    Get.toNamed(Pages.wordDetailsPage, arguments: {'id': id});
  }

  void toBackWithSelectedWords() {
    Get.back(result: wordSelection.selectedIds);
  }

  // --- life cycle
  @override
  void onInit() {
    wordSelection = SelectionState<Word>(
      idOf: (item) => item.id,
      initialSelectionMode: type == WordManagerScreenType.selectWords,
    );
    paginator = PaginationState();
    filterState = FilteringState();
    subscription = _wordRepository.watchWords().listen((event) {
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
