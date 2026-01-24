import 'package:flutter/material.dart';

class RestaurantsTheme {

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        )
      )
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: Colors.orange,
      brightness: Brightness.light,
      // textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: Colors.deepOrange,
      brightness: Brightness.dark,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

}