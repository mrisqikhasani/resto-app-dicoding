import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';

class RestaurantsTheme {

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: RestaurantColor.backgroundLight,
    colorScheme: ColorScheme.fromSeed(
      seedColor: RestaurantColor.primary,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: RestaurantColor.primary,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: RestaurantColor.backgroundDark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: RestaurantColor.primary,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: RestaurantColor.backgroundDark,
      foregroundColor: Colors.white,
    ),
  );

}