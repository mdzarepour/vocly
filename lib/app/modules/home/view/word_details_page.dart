import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/modules/home/controller/word_details_controller.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';
import 'package:vocly/app/shared/widget/vocly_loading.dart';
import 'package:vocly/app/shared/widget/vocly_snackbar.dart';

class WordDetailsScreen extends GetView<WordDetailsController> {
  const WordDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Review word', style: VoclyTypography.titleMedium),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: _cardWidget()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: _listenButton()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: _editButton()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: _deleteButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardWidget() {
    return Obx(() {
      final word = controller.word;
      if (word == null) {
        return const VoclyCard(height: 200, child: VoclyLoading());
      }
      return FlipCard(
        direction: FlipDirection.VERTICAL,
        speed: 250,
        front: Stack(
          children: [
            VoclyCard(
              borderColor: VoclyColor.children[word.color],
              height: 200,
              child: Center(
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      style: VoclyTypography.displayLarge,
                      '${word.name.capitalizeFirst}',
                      // !mode
                      //    ? '${word.name.capitalizeFirst}'
                      // : '${word.name.capitalizeFirst?.replaceAll(RegExp(r'.'), '*')}',
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      style: VoclyTypography.titleMedium,
                      word.type.name,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Icon(VoclyIcon.children[word.icon]),
            ),
          ],
        ),
        back: Stack(
          children: [
            VoclyCard(
              borderColor: VoclyColor.children[word.color],
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      style: VoclyTypography.displayMedium,
                      word.meaning,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      style: VoclyTypography.titleMedium,
                      word.example,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Icon(VoclyIcon.children[word.icon]),
            ),
          ],
        ),
      );
    });
  }

  Widget _editButton() {
    return InkWell(
      onTap: controller.toWordCrudPage,
      child: const VoclyCard(
        height: 50,
        child: Center(child: Text('Edit', style: VoclyTypography.titleMedium)),
      ),
    );
  }

  Widget _deleteButton() {
    return InkWell(
      onTap: _deletWord,
      child: const VoclyCard(
        borderColor: UiColor.errorColor,
        height: 50,
        child: Center(
          child: Text('Delete word', style: VoclyTypography.titleMedium),
        ),
      ),
    );
  }

  Widget _listenButton() {
    return InkWell(
      onTap: controller.listenToWord,
      child: const VoclyCard(
        height: 50,
        child: Row(
          spacing: 15,
          children: [
            Icon(Icons.mic_none_rounded),
            Text(style: VoclyTypography.titleMedium, 'Listen'),
          ],
        ),
      ),
    );
  }

  Future<void> _deletWord() async {
    final either = await controller.deleteWord();
    either.fold(
      (errorMessage) {
        Get.showSnackbar(VoclySnackbar(title: 'Oops!', message: errorMessage));
      },
      (successMessage) {
        controller.toBack();
        Get.showSnackbar(
          VoclySnackbar(title: 'Success', message: successMessage),
        );
      },
    );
  }
}
