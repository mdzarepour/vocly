import 'package:get/get.dart';

class SelectionState<T> {
  final int Function(T item) idOf;
  final bool alwaysSelectionMode;

  SelectionState({required this.idOf, this.alwaysSelectionMode = false});

  // --- state
  final RxSet<int> _selectedIds = <int>{}.obs;

  Set<int> get selectedIds => _selectedIds;
  int get selectedCount => _selectedIds.length;

  bool get isSelectionMode {
    return alwaysSelectionMode || _selectedIds.isNotEmpty;
  }

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

  // --- clear
  void clear() {
    _selectedIds.clear();
  }
}
