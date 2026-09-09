import 'package:isar_community/isar.dart';
import 'package:vocly/app/core/enum/enum/enums.dart';
import 'package:vocly/app/core/error/vocly_error.dart';
import 'package:vocly/app/data/model/filter_model.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/provider/word_provider.dart';

class WordRepository {
  late final WordProvider wordProvider;
  WordRepository({required this.wordProvider});

  Future<void> addWord({required Word word}) async {
    try {
      await wordProvider.addWord(word: word);
    } on IsarError catch (e) {
      throw AppError(errorMessage: e.message);
    }
  }

  Future<void> updateWord({required Word word}) async {
    try {
      await wordProvider.updateWord(word: word);
    } on IsarError catch (e) {
      throw AppError(errorMessage: e.message);
    }
  }

  Future<bool> isWordExist({required String name}) async {
    try {
      return await wordProvider.isWordExist(name: name);
    } on IsarError catch (e) {
      throw AppError(errorMessage: e.message);
    }
  }

  Future<Word?> getWord({required int id}) async {
    try {
      return await wordProvider.getWord(id: id);
    } on IsarError catch (e) {
      throw AppError(errorMessage: e.message);
    }
  }

  Stream<Word?> watchWord({required int id}) {
    try {
      return wordProvider.watchWord(id: id);
    } on IsarError catch (e) {
      throw AppError(errorMessage: e.message);
    }
  }

  Stream<void> watchWords() {
    try {
      return wordProvider.watchWords();
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  Future<List<Word>> getWordsPage({
    required int offset,
    required int limit,
    required WordFilter filter,
    required SortType sort,
  }) async {
    try {
      return await wordProvider.getWordsPage(
        offset: offset,
        limit: limit,
        filter: filter,
        sort: sort,
      );
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  Future<List<Word>> searchWords({
    required String query,
    required int limit,
    required int offset,
  }) async {
    try {
      return await wordProvider.searchWords(
        query: query,
        limit: limit,
        offset: offset,
      );
    } on IsarError catch (e) {
      throw AppError(errorMessage: e.message);
    }
  }

  Future<void> deleteWords({required List<int> ids}) async {
    try {
      await wordProvider.deleteWords(ids: ids);
    } on IsarError catch (e) {
      throw AppError(errorMessage: e.message);
    }
  }
}
