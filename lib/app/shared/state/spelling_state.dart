import 'dart:math';
import 'package:get/get.dart';

class LetterModel {
  const LetterModel({required this.id, required this.value});

  final int id;
  final String value;
}

class SpellingState {
  SpellingState({required this.word}) {
    letters = [];

    for (int i = 0; i < word.length; i++) {
      letters.add(LetterModel(id: i, value: word[i]));
    }
    letters.shuffle(Random());
  }

  final String word;
  late List<LetterModel> letters;

  RxList<int> selectedLetterIds = <int>[].obs;
  RxBool isExpanded = false.obs;
  RxnBool answerResult = RxnBool();

  String get answer {
    String result = '';

    for (int id in selectedLetterIds) {
      for (LetterModel letter in letters) {
        if (letter.id == id) {
          result += letter.value;
          break;
        }
      }
    }
    return result;
  }

  void selectLetter(int letterId) {
    if (_isSelected(letterId: letterId)) {
      return;
    }
    if (selectedLetterIds.length == letters.length) {
      return;
    }
    selectedLetterIds.add(letterId);
    if (selectedLetterIds.length == letters.length) {
      answerResult.value = _checkAnswer();
    }
  }

  void removeLetterAt(int position) {
    if (position < 0 || position >= selectedLetterIds.length) {
      return;
    }
    selectedLetterIds.removeAt(position);
    answerResult.value = null;
  }

  void onExpansionChanged(bool expanded) {
    _reset();
    isExpanded.value = expanded;
  }

  bool _isSelected({required int letterId}) {
    return selectedLetterIds.contains(letterId);
  }

  bool _checkAnswer() {
    if (answer.toLowerCase() == word.toLowerCase()) {
      return true;
    } else {
      return false;
    }
  }

  void _reset() {
    selectedLetterIds.clear();
    answerResult.value = null;
  }
}
