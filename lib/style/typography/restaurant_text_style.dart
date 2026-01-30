import 'package:flutter/material.dart';

class RestaurantTextStyle {
  RestaurantTextStyle._();

  static const String _fontFamily = 'Poppins';

  static const TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
  );
}
