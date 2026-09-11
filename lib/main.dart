import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocly/app/core/router/vocly_router.dart';
import 'package:vocly/app/data/model/book.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/data/provider/book_provider.dart';
import 'package:vocly/app/data/provider/word_provider.dart';
import 'package:vocly/app/shared/theme/vocly_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationSupportDirectory();
  final isar = await Isar.open([
    WordSchema,
    BookSchema,
  ], directory: directory.path);

  Get.put<WordProvider>(WordProvider(isar: isar), permanent: true);
  Get.put<BookProvider>(BookProvider(isar: isar), permanent: true);

  runApp(const Vocly());
}

class Vocly extends StatelessWidget {
  const Vocly({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: VoclyTheme.theme,
      getPages: VoclyRouter.routes,
      initialRoute: '/',
    );
  }
}
