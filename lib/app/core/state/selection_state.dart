import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SelectionState<T> {
  final int Function(T item) idOf;

  SelectionState({required this.idOf});

  // --- state
  final RxSet<int> _selectedIds = <int>{}.obs;
  Set<int> get selectedIds => _selectedIds;

  int get selectedCount => _selectedIds.length;

  bool get isSelectionMode => _selectedIds.isNotEmpty;

  // --- selecting
  bool isSelected(T item) {
    return _selectedIds.contains(idOf(item));
  }

  void select({required T item}) {
    _selectedIds.add(idOf(item));
  }

  void deselect({required T item}) {
    _selectedIds.remove(idOf(item));
  }

  void toggle({required T item}) {
    final id = idOf(item);

    if (_selectedIds.contains(id)) {
      _selectedIds.remove(id);
    } else {
      _selectedIds.add(id);
    }
  }

  // --- select all
  void selectAll(Iterable<T> items) {
    for (final item in items) {
      _selectedIds.add(idOf(item));
    }
  }

  void deselectAll(Iterable<T> items) {
    for (final item in items) {
      _selectedIds.remove(idOf(item));
    }
  }

  void toggleAll({required Iterable<T> items}) {
    final list = items.toList();
    if (list.isEmpty) {
      return;
    }
    if (areAllSelected(items: list)) {
      deselectAll(list);
    } else {
      selectAll(list);
    }
  }

  bool areAllSelected({required Iterable<T> items}) {
    final list = items.toList();
    if (list.isEmpty) {
      return false;
    }
    return list.every(isSelected);
  }

  void clear() {
    _selectedIds.clear();
  }
}
