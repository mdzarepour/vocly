import 'package:isar_community/isar.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/data/model/word.dart';

part 'book.g.dart';

@collection
class Book {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  DateTime createAt = DateTime.now();

  @Index(type: IndexType.value)
  late String name;

  @Index(type: IndexType.value)
  late String description;

  @Index(type: IndexType.value)
  late int color;

  @Index(type: IndexType.value)
  late int icon;

  @Index(type: IndexType.value)
  late bool isLearned;

  @enumerated
  @Index(type: IndexType.value)
  late BookType type;

  @enumerated
  @Index(type: IndexType.value)
  late BookLevel level;

  final words = IsarLinks<Word>();

  Book({
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
    required this.isLearned,
    required this.type,
    required this.level,
  });

  factory Book.create({required Map<String, dynamic> map}) {
    return Book(
      name: map['name'],
      description: map['description'],
      color: map['color'],
      icon: map['icon'],
      isLearned: map['isLearned'],
      type: map['type'],
      level: map['level'],
    );
  }

  void updateBook({
    String? newName,
    String? newDescription,
    int? newColor,
    int? newIcon,
    bool? newIsLearned,
    BookType? newType,
    BookLevel? newLevel,
  }) {
    name = newName ?? name;
    description = newDescription ?? description;
    color = newColor ?? color;
    icon = newIcon ?? icon;
    isLearned = newIsLearned ?? isLearned;
    type = newType ?? type;
    level = newLevel ?? level;
  }
}
