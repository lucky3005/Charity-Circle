import 'package:charity_circle/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => _isDarkMode ? appThemeDark : appTheme;

  Future<void> loadThemeMode(bool val) async {
    _isDarkMode = val;
    notifyListeners();
  }

  Future<void> toggleMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    await pref.setBool("theme_mode", _isDarkMode);
    notifyListeners();
  }

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

  static final appThemeDark = ThemeData(
    fontFamily: 'PlayfairDisplay', // Set the font family globally
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      titleMedium: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.chocolateDark,
    ),
    iconTheme: const IconThemeData(color: AppColors.chocolateDark),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.chocolateDark),
    ),
    useMaterial3: true,
  );
}
