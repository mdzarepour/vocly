import 'package:flutter/material.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';

class VoclyTheme {
  VoclyTheme._();

  static ThemeData theme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomNavigationBarTheme: _bottomNavTheme(),
    scaffoldBackgroundColor: UiColor.backgroundColor,
    dividerTheme: _dividerTheme(),
    expansionTileTheme: _expantionTileTheme(),
    appBarTheme: appbarTheme(),
    inputDecorationTheme: inputTheme(),
    iconTheme: iconTheme(),
    tabBarTheme: tabbraTheme(),
    popupMenuTheme: popupMenuTheme(),
    checkboxTheme: _checkBoxTheme(),
    progressIndicatorTheme: _progressIndicatorTheme(),
  );

  static BottomNavigationBarThemeData _bottomNavTheme() {
    return const BottomNavigationBarThemeData(
      backgroundColor: UiColor.forthColor,
      selectedLabelStyle: VoclyTypography.bodySmall,
      unselectedLabelStyle: VoclyTypography.bodySmall,
      unselectedItemColor: UiColor.thirdColor,
      selectedItemColor: UiColor.thirdColor,
    );
  }

  static ExpansionTileThemeData _expantionTileTheme() {
    return const ExpansionTileThemeData(
      childrenPadding: EdgeInsets.only(bottom: 30),
    );
  }

  static ProgressIndicatorThemeData _progressIndicatorTheme() {
    return const ProgressIndicatorThemeData(color: UiColor.thirdColor);
  }

  static CheckboxThemeData _checkBoxTheme() {
    return const CheckboxThemeData(
      side: BorderSide(width: 2, color: UiColor.thirdColor),
    );
  }

  static DividerThemeData _dividerTheme() {
    return const DividerThemeData(
      radius: BorderRadius.all(Radius.circular(100)),
      color: UiColor.backgroundColor2,
    );
  }

  static PopupMenuThemeData popupMenuTheme() {
    return const PopupMenuThemeData(
      menuPadding: EdgeInsets.all(0),
      shadowColor: Colors.transparent,
      color: UiColor.thirdColor,
    );
  }

  static TabBarThemeData tabbraTheme() {
    return const TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: UiColor.thirdColor,
      splashFactory: NoSplash.splashFactory,
      labelColor: UiColor.thirdColor,
      dividerColor: UiColor.backgroundColor2,
      indicatorColor: UiColor.thirdColor,
      tabAlignment: TabAlignment.start,
    );
  }

  static AppBarThemeData appbarTheme() {
    return const AppBarThemeData(
      toolbarHeight: 70,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      iconTheme: IconThemeData(color: UiColor.thirdColor, size: 22),
      backgroundColor: UiColor.backgroundColor,
    );
  }

  static IconThemeData iconTheme() {
    return const IconThemeData(size: 20, color: UiColor.thirdColor);
  }

  static InputDecorationThemeData inputTheme() {
    return InputDecorationThemeData(
      suffixIconColor: UiColor.thirdColor,
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      hintStyle: VoclyTypography.titleMedium,
      errorStyle: VoclyTypography.bodyMedium.copyWith(
        color: UiColor.thirdColor,
        fontSize: 12,
      ),
    );
  }
}
