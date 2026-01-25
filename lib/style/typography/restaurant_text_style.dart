import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';

class RestaurantTextStyle {
  RestaurantTextStyle._();

  /// BASE
  static const String _fontFamily = 'poppins';

  static const TextStyle _base = TextStyle(
    fontFamily: _fontFamily,
    color: RestaurantColor.textPrimary,
  );

  /// HEADLINE
  static final TextStyle headlineLarge = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle headlineMedium = _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  /// TITLE
  static final TextStyle titleLarge = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle titleMedium = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  /// BODY
  static final TextStyle bodyLarge = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyMedium = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodySmall = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: RestaurantColor.textSecondary,
  );

  /// CAPTION / META
  static final TextStyle caption = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: RestaurantColor.textSecondary,
  );
}
