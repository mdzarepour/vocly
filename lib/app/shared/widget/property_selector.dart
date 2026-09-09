import 'package:flutter/material.dart';

import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';
import 'package:vocly/app/shared/widget/vocly_card.dart';

class PropertySelector<T> extends StatelessWidget {
  // expantion tile title
  final String title;
  // list of wrap items
  final List<T> properties;
  // list of selected items (from)
  final T selectedProperty;
  final ValueChanged<T> onSelected;
  final Widget Function(T property)? childBuilder;

  const PropertySelector({
    super.key,
    required this.title,
    required this.properties,
    required this.selectedProperty,
    required this.onSelected,
    this.childBuilder,
  });

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
          childrenPadding: const EdgeInsets.only(bottom: 15),
          title: Center(child: Text(title, style: VoclyTypography.titleMedium)),
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: properties
                  .map((property) {
                    final isSelected = property == selectedProperty;

                    return InkWell(
                      onTap: () => onSelected(property),
                      child: _buildChild(property, isSelected),
                    );
                  })
                  .toList(growable: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChild(T property, bool isSelected) {
    if (childBuilder != null) {
      return _propertyContainer(
        isSelected: isSelected,
        width: 110,
        child: childBuilder!(property),
      );
    }

    if (property is Color) {
      return _buildColor(property, isSelected);
    }

    if (property is IconData) {
      return _propertyContainer(
        isSelected: isSelected,
        width: 50,
        child: Icon(property),
      );
    }

    return _propertyContainer(
      isSelected: isSelected,
      width: 110,
      child: Text(
        property.toString().split('.').last,
        style: VoclyTypography.titleMedium,
      ),
    );
  }

  Widget _buildColor(Color color, bool isSelected) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: isSelected
            ? Border.all(color: UiColor.thirdColor, width: 2)
            : null,
      ),
      child: isSelected
          ? const Center(
              child: CircleAvatar(
                radius: 5,
                backgroundColor: UiColor.backgroundColor,
              ),
            )
          : null,
    );
  }

  Widget _propertyContainer({
    required bool isSelected,
    required double width,
    required Widget child,
  }) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: UiColor.backgroundColor,
        border: Border.all(
          color: isSelected ? UiColor.thirdColor : UiColor.backgroundColor2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: child),
    );
  }
}
