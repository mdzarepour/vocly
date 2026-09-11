import 'package:isar_community/isar.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/data/model/filter.dart';
import 'package:vocly/app/data/model/word.dart';

class WordProvider {
  late final Isar isar;

  WordProvider({required this.isar});

  // --- crud operations
  Future<void> addWord({required Word word}) async {
    await isar.writeTxn(() async {
      await isar.words.put(word);
    });
  }

  Future<void> updateWord({required Word word}) async {
    await isar.writeTxn(() async {
      await isar.words.put(word);
    });
  }

  Future<bool> isWordExist({required String name}) async {
    final result = await isar.words.filter().nameEqualTo(name).findFirst();
    return result != null;
  }

  Future<Word?> getWord({required int id}) async {
    return isar.words.get(id);
  }

  Future<void> deleteWords({required List<int> ids}) async {
    isar.writeTxn(() async {
      await isar.words.deleteAll(ids);
    });
  }

  Future<List<Word>> getWordsById({required List<int> ids}) async {
    final result = await isar.words.getAll(ids);
    return result.whereType<Word>().toList();
  }

  // --- listeners
  Stream<Word?> watchWord({required int id}) {
    return isar.words.watchObject(id);
  }

  Stream<void> watchWords() {
    return isar.words.watchLazy(fireImmediately: true);
  }

  // --- get paged values
  Future<List<Word>> searchWords({
    required String query,
    required int offset,
    required int limit,
  }) async {
    await Future.delayed(const Duration(milliseconds: 350));
    if (query.isEmpty) {
      return await isar.words.where().offset(offset).limit(limit).findAll();
    }
    return await isar.words
        .where()
        .nameStartsWith(query)
        .or()
        .meaningWordsElementStartsWith(query)
        .or()
        .exampleWordsElementStartsWith(query)
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  Future<List<Word>> getWordsPage({
    required int offset,
    required int limit,
    required Filter filter,
    required SortType sort,
  }) async {
    final filtered = isar.words
        .filter()
        .optional(filter.colors.isNotEmpty, (q) {
          return q.anyOf(
            filter.colors,
            (query, color) => query.colorEqualTo(color),
          );
        })
        .optional(filter.icons.isNotEmpty, (q) {
          return q.anyOf(
            filter.icons,
            (query, icon) => query.iconEqualTo(icon),
          );
        })
        .optional(filter.types.isNotEmpty, (q) {
          return q.anyOf(
            filter.types,
            (query, type) => query.typeEqualTo(type),
          );
        })
        .optional(filter.levels.isNotEmpty, (q) {
          return q.anyOf(
            filter.levels,
            (query, level) => query.levelEqualTo(level),
          );
        });
    if (sort == SortType.none) {
      return await filtered.offset(offset).limit(limit).findAll();
    }

    final QueryBuilder<Word, Word, QAfterSortBy> sorted;
    switch (sort) {
      case SortType.sortAtoZ:
        sorted = filtered.sortByName();
        break;
      case SortType.sortZtoA:
        sorted = filtered.sortByNameDesc();
        break;
      case SortType.sortNewest:
        sorted = filtered.sortByCreateAtDesc();
        break;
      case SortType.sortOldest:
        sorted = filtered.sortByCreateAt();
        break;
      case SortType.none:
        throw StateError('unreachable');
    }
    return await sorted.offset(offset).limit(limit).findAll();
  }
}
