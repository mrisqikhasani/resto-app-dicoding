import 'package:flutter/material.dart';
import 'package:resto_app_dicoding/style/restaurant_color.dart';
import 'package:resto_app_dicoding/style/typography/restaurant_text_style.dart';

class RestaurantsTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',

    colorScheme: ColorScheme.fromSeed(
      seedColor: RestaurantColor.primary,
      brightness: Brightness.light,
    ),

    textTheme: RestaurantTextStyle.textTheme,

    scaffoldBackgroundColor: RestaurantColor.backgroundLight,

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: RestaurantColor.primary,
      foregroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',

    colorScheme: ColorScheme.fromSeed(
      seedColor: RestaurantColor.primary,
      brightness: Brightness.dark,
    ),

    textTheme: RestaurantTextStyle.textTheme,

    scaffoldBackgroundColor: RestaurantColor.backgroundDark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}
