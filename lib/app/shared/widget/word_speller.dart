import 'package:flutter/material.dart';
import 'package:vocly/app/shared/state/spelling_state.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';

class WordSpeller extends StatelessWidget {
  const WordSpeller({
    required this.letters,
    required this.selectedLetterIds,
    required this.answerResult,
    required this.onLetterSelected,
    required this.onAnswerLetterRemoved,
    required this.onExpansionChanged,
    super.key,
  });

  final List<LetterModel> letters;
  final List<int> selectedLetterIds;
  final bool? answerResult;
  final void Function(int) onLetterSelected;
  final void Function(int) onAnswerLetterRemoved;
  final void Function(bool) onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return VoclyCard(
      withPadding: false,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          dense: true,
          minTileHeight: 50,
          showTrailingIcon: false,
          splashColor: Colors.transparent,
          onExpansionChanged: onExpansionChanged,
          childrenPadding: const EdgeInsets.only(bottom: 15),
          title: const Center(
            child: Text("Practice", style: VoclyTypography.titleMedium),
          ),
          children: [
            Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(letters.length, (index) {
                    final hasLetter = index < selectedLetterIds.length;
                    final selectedLetter = hasLetter
                        ? letters.firstWhere((letter) {
                            return letter.id == selectedLetterIds[index];
                          })
                        : null;
                    final slotBorderColor = answerResult == null
                        ? hasLetter
                              ? Colors.white
                              : UiColor.backgroundColor2
                        : answerResult!
                        ? UiColor.positiveColor
                        : UiColor.errorColor;
                    return InkWell(
                      onTap: hasLetter
                          ? () {
                              onAnswerLetterRemoved(index);
                            }
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      child: _letterCard(
                        borderColor: slotBorderColor,
                        child: Text(
                          selectedLetter?.value ?? '',
                          style: VoclyTypography.titleMedium,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                const Divider(endIndent: 20, indent: 20),
                const SizedBox(height: 15),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: letters
                      .map((letter) {
                        final isSelected = selectedLetterIds.contains(
                          letter.id,
                        );
                        return InkWell(
                          onTap: isSelected
                              ? null
                              : () {
                                  onLetterSelected(letter.id);
                                },
                          borderRadius: BorderRadius.circular(10),
                          child: _letterCard(
                            borderColor: isSelected
                                ? UiColor.backgroundColor2
                                : Colors.white,
                            child: Text(
                              isSelected ? '' : letter.value,
                              style: VoclyTypography.titleMedium,
                            ),
                          ),
                        );
                      })
                      .toList(growable: false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _letterCard({required Color borderColor, required Widget child}) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          color: UiColor.forthColor,
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Center(child: child),
      ),
    );
  }
}
