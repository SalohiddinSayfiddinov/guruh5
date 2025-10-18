import 'package:flutter/material.dart';
import 'package:guruh5/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 20.0, color: Colors.black),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(backgroundColor: Colors.red),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 20.0, color: Colors.white),
    ),
  );
}
