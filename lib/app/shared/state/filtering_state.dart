import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/data/model/filter.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';

class FilteringState {
  //---------------------------------Filter-------------------------------------

  // --- state
  final RxList<int> colors = <int>[].obs;
  final RxList<int> icons = <int>[].obs;
  final RxList<WordType> types = <WordType>[].obs;
  final RxList<WordLevel> levels = <WordLevel>[].obs;

  // --- setters
  Filter get filter {
    return Filter(colors, icons, types, levels);
  }

  List<Color> get selectedColors {
    return colors.map((index) => VoclyColor.children[index]).toList();
  }

  List<IconData> get selectedIcons {
    return icons.map((index) => VoclyIcon.children[index]).toList();
  }

  // --- create draft
  FilteringState copy() {
    final draft = FilteringState();

    draft.colors.assignAll(colors);
    draft.icons.assignAll(icons);
    draft.types.assignAll(types);
    draft.levels.assignAll(levels);

    return draft;
  }

  // --- apply draft
  void apply(FilteringState draft) {
    colors.assignAll(draft.colors);
    icons.assignAll(draft.icons);
    types.assignAll(draft.types);
    levels.assignAll(draft.levels);
  }

  // --- change filter
  void toggleColor({required int value}) {
    if (colors.contains(value)) {
      colors.remove(value);
    } else {
      colors.add(value);
    }
  }

  void toggleIcon({required int value}) {
    if (icons.contains(value)) {
      icons.remove(value);
    } else {
      icons.add(value);
    }
  }

  void toggleType({required WordType value}) {
    if (types.contains(value)) {
      types.remove(value);
    } else {
      types.add(value);
    }
  }

  void toggleLevel({required WordLevel value}) {
    if (levels.contains(value)) {
      levels.remove(value);
    } else {
      levels.add(value);
    }
  }

  //---------------------------------SORT---------------------------------------

  // --- state
  final Rx<SortType> _sortType = Rx(SortType.sortNewest);
  SortType get sort => _sortType.value;

  // --- change sort
  void changeSort({required SortType sortType}) {
    _sortType.value = sortType;
  }
}
