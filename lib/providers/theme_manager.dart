import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _thememode = ThemeMode.light;

  get themeMode => _thememode;

  toggleTheme(bool isDark) {
    _thememode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
