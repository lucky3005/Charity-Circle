import 'package:charity_circle/core/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData(
    fontFamily: 'PlayfairDisplay', // Set the font family globally
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      titleMedium: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
    ),

    //scaffoldBackgroundColor: Colors.white,
    scaffoldBackgroundColor: AppColors.background,

    //scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.chocolate,
    ),

    iconTheme: const IconThemeData(color: AppColors.chocolate),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.chocolate),
    ),

    useMaterial3: true,
  );
}
