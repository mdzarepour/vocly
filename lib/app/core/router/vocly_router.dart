import 'package:get/get.dart';
import 'package:vocly/app/core/binding/initial_binding.dart';
import 'package:vocly/app/modules/home/binding/home_binding.dart';
import 'package:vocly/app/modules/home/view/home_page.dart';
import 'package:vocly/app/modules/home/view/search_page.dart';
import 'package:vocly/app/modules/home/view/word_crud_page.dart';
import 'package:vocly/app/core/router/pages.dart';
import 'package:vocly/app/modules/home/view/word_details_page.dart';
import 'package:vocly/app/modules/home/view/word_manage_page.dart';
import 'package:vocly/app/shared/shell/vocly_shell.dart';

class VoclyRouter {
  VoclyRouter._();

  static final routes = [
    GetPage(
      showCupertinoParallax: false,
      name: Pages.initialPage,
      page: () => const VoclyShell(),
      binding: InitialBinding(),
    ),
    GetPage(
      showCupertinoParallax: false,
      name: Pages.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      showCupertinoParallax: false,
      name: Pages.wordCrudPage,
      page: () => const WordCrudPage(),
      binding: WordCrudBinding(),
    ),
    GetPage(
      showCupertinoParallax: false,
      name: Pages.searchPage,
      page: () => const SearchPage(),
      binding: WordSearchBinding(),
    ),
    GetPage(
      showCupertinoParallax: false,
      name: Pages.wordManagePage,
      page: () => const WordManagePage(),
      binding: WordManageBinding(),
    ),
    GetPage(
      showCupertinoParallax: false,
      name: Pages.wordDetailsPage,
      page: () => const WordDetailsScreen(),
      binding: WordDetailsBinding(),
    ),
  ];
}
