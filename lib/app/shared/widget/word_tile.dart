import 'package:flutter/material.dart';
import 'package:vocly/app/data/model/word.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/constant/vocly_icon.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';

class WordTile extends StatelessWidget {
  final bool isSmallTile;
  final Word word;
  final Color? borderColor;
  final void Function()? onLongPress;
  final void Function()? onTap;

  const WordTile({
    super.key,
    this.onTap,
    this.onLongPress,
    this.borderColor,
    required this.word,
    required this.isSmallTile,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: isSmallTile
          ? VoclyCard(
              height: 68,
              borderColor: borderColor,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 1,
                      children: [
                        const SizedBox(width: double.infinity),
                        Text(
                          word.name,
                          overflow: TextOverflow.ellipsis,
                          style: VoclyTypography.titleMedium,
                        ),
                        Text(
                          word.type.name,
                          overflow: TextOverflow.ellipsis,
                          style: VoclyTypography.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: VoclyColor.children[word.color],
                  ),
                ],
              ),
            )
          : VoclyCard(
              height: 68,
              borderColor: borderColor,
              child: Row(
                spacing: 15,
                children: [
                  Icon(VoclyIcon.children[word.icon]),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: VoclyTypography.titleMedium,
                          word.name,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: VoclyTypography.titleSmall,
                          word.meaning,
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: VoclyColor.children[word.color],
                    radius: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
