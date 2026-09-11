import 'package:vocly/app/core/enum/enums.dart';

class FilterModel {
  List<int> colors;
  List<int> icons;
  List<WordType> types;
  List<WordLevel> levels;

  FilterModel(this.colors, this.icons, this.types, this.levels);
}
