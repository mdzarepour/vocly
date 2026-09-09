import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/modules/home/controller/home_controller.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchWidget(),
        const SizedBox(height: 40),
        const Text(' Your vocabulary', style: VoclyTypography.titleMedium),
        const SizedBox(height: 15),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: _HomeButton(
                title: 'Books',
                data: '1 book',
                icon: Icons.menu_book_outlined,
                onTap: () {},
              ),
            ),
            Expanded(
              child: _HomeButton(
                title: 'Words',
                data: '5 words',
                icon: Icons.language_outlined,
                onTap: () => controller.toWordManagePage(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: _HomeButton(
                title: 'Add book',
                icon: Icons.add,
                onTap: () {},
              ),
            ),
            Expanded(
              child: _HomeButton(
                title: 'Add word',
                icon: Icons.add,
                onTap: () => controller.toWordCrudPage(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        const Text(' Download read books', style: VoclyTypography.titleMedium),
        const SizedBox(height: 15),
        _HomeButton(
          title: 'Use prepared books',
          data: 'Import popular vocabulary books',
          icon: Icons.coffee_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 25),
        const Text(' Backup your data', style: VoclyTypography.titleMedium),
        const SizedBox(height: 15),
        _HomeButton(
          title: 'Export your vocabulary',
          data: 'Backup your words as a pdf file',
          icon: Icons.folder_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 10),
        _HomeButton(
          title: 'Use prepared books',
          data: 'Import you backup vocabulary',
          icon: Icons.import_export_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _searchWidget() {
    return InkWell(
      onTap: () => controller.toSearchPage(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: UiColor.forthColor,
          border: Border.all(color: UiColor.blueHighLightColor),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: const SizedBox(
                height: 50,
                width: 40,
                child: Icon(Icons.menu),
              ),
            ),
            const Text(style: VoclyTypography.titleMedium, 'Search'),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: const SizedBox(
                height: 50,
                width: 40,
                child: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final String title;
  final String? data;
  final IconData icon;
  final void Function()? onTap;

  const _HomeButton({
    this.data,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: VoclyCard(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15,
          children: data == null
              ? [Icon(icon), Text(title, style: VoclyTypography.titleMedium)]
              : [
                  Icon(icon),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(style: VoclyTypography.titleMedium, title),
                      Text(style: VoclyTypography.titleSmall, data!),
                    ],
                  ),
                ],
        ),
      ),
    );
  }
}
