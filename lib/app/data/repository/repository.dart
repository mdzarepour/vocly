import 'package:isar_community/isar.dart';
import 'package:vocly/app/core/enum/enums.dart';
import 'package:vocly/app/core/error/vocly_error.dart';
import 'package:vocly/app/data/model/book.dart';
import 'package:vocly/app/data/model/filter.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/provider/book_provider.dart';
import 'package:vocly/app/data/provider/word_provider.dart';

abstract class BookRepository {
  Future<void> addBook({required Book book, required List<int> ids});
  Future<void> updateBook({required Book book});
  Future<bool> isBookExist({required String name});
  Future<Book?> getBook({required int id});
}

abstract class WordRepository {
  Future<void> addWord({required Word word});
  Future<void> updateWord({required Word word});
  Future<bool> isWordExist({required String name});
  Future<Word?> getWord({required int id});
  Stream<Word?> watchWord({required int id});
  Stream<void> watchWords();

  Future<List<Word>> getWordsPage({
    required int offset,
    required int limit,
    required Filter filter,
    required SortType sort,
  });

  Future<List<Word>> searchWords({
    required String query,
    required int limit,
    required int offset,
  });

  Future<void> deleteWords({required List<int> ids});
}

class Repository implements WordRepository, BookRepository {
  final WordProvider wordProvider;
  final BookProvider bookProvider;

  Repository({required this.wordProvider, required this.bookProvider});

  // --- word methods ----------------------------------------------------------

  @override
  Future<void> addWord({required Word word}) async {
    try {
      await wordProvider.addWord(word: word);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<void> updateWord({required Word word}) async {
    try {
      await wordProvider.updateWord(word: word);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<bool> isWordExist({required String name}) async {
    try {
      return await wordProvider.isWordExist(name: name);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<Word?> getWord({required int id}) async {
    try {
      return await wordProvider.getWord(id: id);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Stream<Word?> watchWord({required int id}) {
    try {
      return wordProvider.watchWord(id: id);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Stream<void> watchWords() {
    try {
      return wordProvider.watchWords();
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<List<Word>> getWordsPage({
    required int offset,
    required int limit,
    required Filter filter,
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

  @override
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
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<void> deleteWords({required List<int> ids}) async {
    try {
      await wordProvider.deleteWords(ids: ids);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  // --- book methods ----------------------------------------------------------

  @override
  Future<void> addBook({required Book book, required List<int> ids}) async {
    try {
      final words = await wordProvider.getWordsById(ids: ids);
      await bookProvider.addBook(book: book, words: words);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<void> updateBook({required Book book}) async {
    try {
      await bookProvider.updateBook(book: book);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<bool> isBookExist({required String name}) async {
    try {
      return await bookProvider.isBookExist(name: name);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<Book?> getBook({required int id}) async {
    try {
      return await bookProvider.getBook(id: id);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }
}
