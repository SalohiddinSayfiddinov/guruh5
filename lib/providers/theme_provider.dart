import 'package:flutter/material.dart';
import 'package:guruh5/core/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;
  ThemeData get getCurrentTheme =>
      _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
