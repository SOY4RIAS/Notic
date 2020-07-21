import 'package:flutter/material.dart';

enum AppThemeType { DARK, LIGHT }

ThemeData appTheme({AppThemeType type = AppThemeType.LIGHT}) {
  ThemeData defaultTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.redAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.white,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(),
  );

  ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    accentColor: Colors.redAccent,
    appBarTheme: AppBarTheme(
      elevation: 10,
    ),
    textTheme: ThemeData.dark().textTheme,
  );

  return type == AppThemeType.LIGHT ? defaultTheme : darkTheme;
}
