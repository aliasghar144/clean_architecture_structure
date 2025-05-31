import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  ThemeProvider() {
    loadTheme();
  }
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void loadTheme() {
    final isDark = PreferencesManager.isDarkMode();
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    PreferencesManager.setDarkMode(isDark);
    notifyListeners();
  }
}
