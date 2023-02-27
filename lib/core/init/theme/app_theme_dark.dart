import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: _buildColorScheme,
        appBarTheme: _appBarTheme,
        iconTheme: _iconTheme,
      );

  IconThemeData get _iconTheme => IconThemeData(
        color: _buildColorScheme.onSecondary,
        size: 30,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        elevation: 0,
        backgroundColor: _buildColorScheme.background,
      );

  ColorScheme get _buildColorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: Colors.blue.shade900,
        onPrimary: Colors.blue,
        secondary: Colors.black, // used
        onSecondary: const Color(0xFF6c63ff), // used
        error: Colors.red,
        onError: Colors.orange,
        background: Colors.white, // used
        onBackground: Colors.grey, // used
        surface: Colors.yellow,
        onSurface: Colors.pink,
      );
}
