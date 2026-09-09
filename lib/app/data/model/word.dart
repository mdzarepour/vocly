import 'package:isar_community/isar.dart';
import 'package:vocly/app/core/enum/enum/enums.dart';

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

  factory Word.create({required Map<String, dynamic> map}) {
    return Word(
      name: map['name'],
      meaning: map['meaning'],
      example: map['example'],
      color: map['color'],
      icon: map['icon'],
      isLearned: map['isLearned'],
      type: map['type'],
      level: map['level'],
    );
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
