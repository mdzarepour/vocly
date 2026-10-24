import 'dart:async';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/core/service/dialog_service.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/repository/repository.dart';
import 'package:vocly/app/shared/state/filtering_state.dart';
import 'package:vocly/app/shared/state/pagination_state.dart';
import 'package:vocly/app/shared/state/selection_state.dart';

class WordManageController extends GetxController {
  final WordRepository _wordRepository;
  final DialogService _dialogService;
  final WordManagerScreenType type;
  final List<int> initialSelectedIds;

  WordManageController(
    this.type,
    this._wordRepository,
    this._dialogService, {
    this.initialSelectedIds = const [],
  });

  late final StreamSubscription _subscription;
  late final PaginationState paginator;
  late final FilteringState filterState;
  late final SelectionState wordSelection;

  final RxList<Word> _words = <Word>[].obs;
  List<Word> get words => _words;

  final Rx<LoadingStatus> _loading = Rx(LoadingStatus.init);
  LoadingStatus get isLoading => _loading.value;

  final Rx<ScreenLayout> _layout = ScreenLayout.listView.obs;
  ScreenLayout get layout => _layout.value;

  int _generation = 0;

  void toggleLayout() {
    _layout.value = _layout.value == ScreenLayout.gridView
        ? ScreenLayout.listView
        : ScreenLayout.gridView;
  }

  Future<void> fetchWords() async {
    if (_loading.value == LoadingStatus.working) return;

    final generation = _generation;
    if (_loading.value != LoadingStatus.init) {
      _loading.value = LoadingStatus.working;
    }
    try {
      await paginator.fetchNextPage<Word>(
        fetcher: (limit, offset) async => _wordRepository.getWordsPage(
          filter: filterState.filter,
          sort: filterState.sort,
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

  Future<void> refreshPage() {
    _generation++;
    _words.clear();
    paginator.reset();
    _loading.value = LoadingStatus.none;
    return fetchWords();
  }

  Future<void> deleteSelectedWords() async {
    final ids = wordSelection.selectedIds.toList();
    if (ids.isEmpty) return;

    final permission = await _dialogService.showDialog(
      title: "Deleting",
      content: "Are you sure about deleting words",
      confirmTitle: "Delete",
    );
    if (!permission) return;

    await _wordRepository.deleteWords(ids: ids);
    wordSelection.clear();
  }

  void toWordDetailsPage({required int id}) {
    Get.toNamed(Pages.wordDetailsPage, arguments: {"id": id});
  }

  void toBackWithSelectedWords() {
    Get.back(result: wordSelection.selectedIds.toList());
  }

  void toBack() => Get.back();

  @override
  void onInit() {
    wordSelection = SelectionState<Word>(
      idOf: (item) => item.id,
      alwaysSelectionMode: type == WordManagerScreenType.selectWords,
    );
    wordSelection.selectedIds.addAll(initialSelectedIds);
    paginator = PaginationState();
    filterState = FilteringState();
    _subscription = _wordRepository.watchWords().listen((_) => refreshPage());
    super.onInit();
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
