import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaginationState {
  final int pageSize;

  PaginationState({this.pageSize = 150});
  // --- state
  final RxBool _isLoadingMore = false.obs;
  bool get isLoadingMore => _isLoadingMore.value;

  final RxBool _hasMore = true.obs;
  bool get hasMore => _hasMore.value;

  void updateHasMore({required int length}) {
    _hasMore.value = length == pageSize;
  }

  void reset() {
    _isLoadingMore.value = false;
    _hasMore.value = true;
  }

  // --- fetch more data
  Future<void> fetchNextPage<T>({
    required int listLength,
    required Future<List<T>> Function(int limit, int offset) fetcher,
    required Function(List<T> newItems) onSuccess,
  }) async {
    if (_isLoadingMore.value || !_hasMore.value) {
      return;
    }
    _isLoadingMore.value = true;
    try {
      final newItems = await fetcher(pageSize, listLength);
      _hasMore.value = newItems.length == pageSize;
      onSuccess(newItems);
    } finally {
      _isLoadingMore.value = false;
    }
  }

  // --- function trigger on max scroll
  bool onScroll(ScrollNotification notification) {
    if (notification is! ScrollUpdateNotification) {
      return false;
    }
    final metrics = notification.metrics;
    if (metrics.pixels >= metrics.maxScrollExtent - 300) {
      return true;
    } else {
      return false;
    }
  }
}
