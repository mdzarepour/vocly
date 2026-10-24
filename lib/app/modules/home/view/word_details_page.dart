import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/modules/home/controller/word_details_controller.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/widget/word_speller.dart';
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
      body: const SafeArea(child: _WordDetailsBody()),
    );
  }
}

class _WordDetailsBody extends StatelessWidget {
  const _WordDetailsBody();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(child: _WordCard()),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(child: _ListenButton()),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(child: _SpellingPracticeWidget()),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(child: _EditButton()),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(child: _DeleteButton()),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}

class _WordCard extends GetView<WordDetailsController> {
  const _WordCard();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final word = controller.word;
      final spellingState = controller.spellingState;
      final isExpanded = spellingState?.isExpanded.value ?? false;
      if (word == null) {
        return const VoclyCard(height: 200, child: VoclyLoading());
      }
      return FlipCard(
        direction: FlipDirection.VERTICAL,
        speed: 250,
        front: _WordCardFront(word: word, isExpanded: isExpanded),
        back: _WordCardBack(word: word, isExpanded: isExpanded),
      );
    });
  }
}

class _WordCardFront extends StatelessWidget {
  final Word word;
  final bool isExpanded;
  const _WordCardFront({required this.word, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    String wordName = word.name.capitalizeFirst ?? word.name;
    if (isExpanded) {
      wordName = word.name.replaceAll(RegExp(r'.', dotAll: true), '*');
    }
    return Stack(
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
                  wordName,
                  textAlign: TextAlign.center,
                  style: VoclyTypography.displayLarge,
                ),
                Text(
                  word.type.name,
                  textAlign: TextAlign.center,
                  style: VoclyTypography.titleMedium,
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
    );
  }
}

class _WordCardBack extends StatelessWidget {
  final Word word;
  final bool isExpanded;
  const _WordCardBack({required this.word, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    String wordExample = word.example.capitalizeFirst ?? word.example;
    if (isExpanded) {
      wordExample = word.name.replaceAll(RegExp(r'.', dotAll: true), '*');
    }
    return Stack(
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
                  word.meaning,
                  textAlign: TextAlign.center,
                  style: VoclyTypography.displayMedium,
                ),
                Text(
                  wordExample,
                  textAlign: TextAlign.center,
                  style: VoclyTypography.titleMedium,
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
    );
  }
}

class _ListenButton extends GetView<WordDetailsController> {
  const _ListenButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.listenToWord,
      child: const VoclyCard(
        height: 50,
        child: Row(
          spacing: 15,
          children: [
            Icon(Icons.mic_none_rounded),
            Text('Listen', style: VoclyTypography.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _SpellingPracticeWidget extends GetView<WordDetailsController> {
  const _SpellingPracticeWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final word = controller.word;
      final spellingState = controller.spellingState;
      if (word == null || spellingState == null) {
        return const SizedBox.shrink();
      }
      final letters = spellingState.selectedLetterIds.toList();
      return WordSpeller(
        letters: spellingState.letters,
        selectedLetterIds: letters,
        answerResult: spellingState.answerResult.value,
        onLetterSelected: spellingState.selectLetter,
        onAnswerLetterRemoved: spellingState.removeLetterAt,
        onExpansionChanged: spellingState.onExpansionChanged,
      );
    });
  }
}

class _EditButton extends GetView<WordDetailsController> {
  const _EditButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.toWordCrudPage,
      child: const VoclyCard(
        height: 50,
        child: Center(child: Text('Edit', style: VoclyTypography.titleMedium)),
      ),
    );
  }
}

class _DeleteButton extends GetView<WordDetailsController> {
  const _DeleteButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _deleteWord,
      child: const VoclyCard(
        borderColor: UiColor.errorColor,
        height: 50,
        child: Center(
          child: Text('Delete word', style: VoclyTypography.titleMedium),
        ),
      ),
    );
  }

  Future<void> _deleteWord() async {
    final either = await controller.deleteWord();
    if (either == null) return;
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
