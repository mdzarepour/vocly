import 'dart:typed_data';
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
  Future<void> updateBook({required Book book, required List<int> ids});
  Future<bool> isBookExist({required String name});
  Future<Book?> getBook({required int id});
  Stream<Book?> watchBook({required int id});
  Stream<int> watchBooksCount();
  Stream<void> watchBooks();
  Future<List<Book>> getBooksPage({required int offset, required int limit});
  Future<void> deleteBooks({required List<int> ids});
  Future<List<Word>> getBookWordsPage({
    required int bookId,
    required int offset,
    required int limit,
  });
}

abstract class WordRepository {
  Future<void> addWord({required Word word});
  Future<void> updateWord({required Word word});
  Future<bool> isWordExist({required String name});
  Future<Word?> getWord({required int id});
  Stream<Word?> watchWord({required int id});
  Stream<void> watchWords();
  Stream<int> watchWordsCount();

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
  Future<Uint8List> exportWords();
  Future<void> importWords({required String data});
}

class Repository implements WordRepository, BookRepository {
  final WordProvider _wordProvider;
  final BookProvider _bookProvider;

  Repository(this._bookProvider, this._wordProvider);

  // -------------------------------------------------------------

  @override
  Future<void> addWord({required Word word}) async {
    try {
      await _wordProvider.addWord(word: word);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<void> updateWord({required Word word}) async {
    try {
      await _wordProvider.updateWord(word: word);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<bool> isWordExist({required String name}) async {
    try {
      return await _wordProvider.isWordExist(name: name);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<Word?> getWord({required int id}) async {
    try {
      return await _wordProvider.getWord(id: id);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Stream<Word?> watchWord({required int id}) {
    try {
      return _wordProvider.watchWord(id: id);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Stream<void> watchWords() {
    try {
      return _wordProvider.watchWords();
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Stream<int> watchBooksCount() {
    try {
      return _bookProvider.watchBooksCount();
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message);
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
      return await _wordProvider.getWordsPage(
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
      return await _wordProvider.searchWords(
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
      await _wordProvider.deleteWords(ids: ids);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<Uint8List> exportWords() async {
    try {
      return await _wordProvider.exportWords();
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<void> importWords({required String data}) async {
    try {
      await _wordProvider.importWords(data: data);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  // -------------------------------------------------------------

  @override
  Future<void> addBook({required Book book, required List<int> ids}) async {
    try {
      final words = await _wordProvider.getWordsById(ids: ids);
      await _bookProvider.addBook(book: book, words: words);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<void> updateBook({required Book book, required List<int> ids}) async {
    try {
      final words = await _wordProvider.getWordsById(ids: ids);
      await _bookProvider.updateBook(book: book, words: words);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<bool> isBookExist({required String name}) async {
    try {
      return await _bookProvider.isBookExist(name: name);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<Book?> getBook({required int id}) async {
    try {
      return await _bookProvider.getBook(id: id);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<void> deleteBooks({required List<int> ids}) async {
    try {
      return await _bookProvider.deleteBooks(ids: ids);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Future<List<Book>> getBooksPage({
    required int offset,
    required int limit,
  }) async {
    try {
      return await _bookProvider.getPagedBooks(offset: offset, limit: limit);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Stream<void> watchBooks() {
    try {
      return _bookProvider.watchBooks();
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Stream<Book?> watchBook({required int id}) {
    try {
      return _bookProvider.watchBook(id: id);
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }

  @override
  Stream<int> watchWordsCount() {
    try {
      return _wordProvider.watchWordsCount();
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message);
    }
  }

  @override
  Future<List<Word>> getBookWordsPage({
    required int bookId,
    required int offset,
    required int limit,
  }) async {
    try {
      return await _bookProvider.getBookWordsPage(
        bookId: bookId,
        offset: offset,
        limit: limit,
      );
    } on IsarError catch (error) {
      throw AppError(errorMessage: error.message, cause: error);
    }
  }
}
