import 'package:flutter/material.dart';
import 'package:vocly/app/shared/constant/vocly_color.dart';

class VoclyTypography {
  VoclyTypography._();

  static const String _fontFamily = 'Roboto';

  // Display
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0.5,
    color: UiColor.thirdColor,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 25,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0.0,
    color: UiColor.thirdColor,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.1,
    letterSpacing: 0.0,
    color: UiColor.thirdColor,
  );

  // Headline
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.0,
    color: UiColor.thirdColor,
  );

  // Title
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0.0,
    color: UiColor.thirdColor,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.15,
    color: UiColor.thirdColor,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w300,
    height: 1.4,
    letterSpacing: 0.1,
    color: UiColor.thirdColor,
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
    color: UiColor.thirdColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.25,
    color: UiColor.thirdColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.0,
    color: UiColor.thirdColor,
  );

  // Label
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.1,
    color: UiColor.forthColor,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.5,
    color: UiColor.forthColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.5,
    color: UiColor.forthColor,
  );
}
