import 'package:isar_community/isar.dart';
import 'package:vocly/app/core/enum/enums.dart';

part 'word.g.dart';

@collection
class Word {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  DateTime createAt = DateTime.now();

  @Index(type: IndexType.value, caseSensitive: false)
  late String name;

  late String meaning;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get meaningWords => Isar.splitWords(meaning);

  late String example;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get exampleWords => Isar.splitWords(example);

  @Index(type: IndexType.value)
  late int color;

  @Index(type: IndexType.value)
  late int icon;

  @Index(type: IndexType.value)
  late bool isLearned;

  @enumerated
  @Index(type: IndexType.value)
  late WordType type;

  @enumerated
  @Index(type: IndexType.value)
  late WordLevel level;

  Word({
    required this.name,
    required this.meaning,
    required this.example,
    required this.color,
    required this.icon,
    required this.isLearned,
    required this.type,
    required this.level,
  });

  factory Word.fromMap({required Map<String, dynamic> map}) {
    return Word(
      name: map["name"] as String,
      meaning: map["meaning"] as String,
      example: map["example"] as String,
      color: map["color"] as int,
      icon: map["icon"] as int,
      isLearned: map["isLearned"] as bool,
      type: map["type"] is int
          ? WordType.values[map["type"] as int]
          : map["type"] as WordType,
      level: map["level"] is int
          ? WordLevel.values[map["level"] as int]
          : map["level"] as WordLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "meaning": meaning,
      "example": example,
      "color": color,
      "icon": icon,
      "isLearned": isLearned,
      "type": type.index,
      "level": level.index,
    };
  }

  void updateWord({
    String? newName,
    String? newMeaning,
    String? newExample,
    int? newColor,
    int? newIcon,
    bool? newIsLearned,
    WordType? newType,
    WordLevel? newLevel,
  }) {
    name = newName ?? name;
    meaning = newMeaning ?? meaning;
    example = newExample ?? example;
    color = newColor ?? color;
    icon = newIcon ?? icon;
    isLearned = newIsLearned ?? isLearned;
    type = newType ?? type;
    level = newLevel ?? level;
  }
}
