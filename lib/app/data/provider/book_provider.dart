import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:vocly/app/data/model/book.dart';
import 'package:vocly/app/data/model/word.dart';

class BookProvider {
  late final Isar isar;
  BookProvider({required this.isar});

  Future<void> addBook({required Book book, required List<Word> words}) async {
    await isar.writeTxn(() async {
      await isar.books.put(book);
      book.words.assignAll(words);
      await book.words.save();
    });
  }

  Future<void> deleteBooks({required List<int> ids}) async {
    isar.writeTxn(() async {
      await isar.books.deleteAll(ids);
    });
  }

  Future<void> updateBook({required Book book}) async {
    await isar.writeTxn(() async {
      await isar.books.put(book);
    });
  }

  Future<bool> isBookExist({required String name}) async {
    final result = await isar.books.filter().nameEqualTo(name).findFirst();
    return result != null;
  }

  Future<Book?> getBook({required int id}) async {
    return isar.books.get(id);
  }

  Stream<void> watchBooks() {
    return isar.books.watchLazy(fireImmediately: true);
  }

  Future<List<Book>> getPagedBooks({
    required int limit,
    required int offset,
  }) async {
    return await isar.books.where().offset(offset).limit(limit).findAll();
  }
}
