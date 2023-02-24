import 'package:flutter/material.dart';
import 'package:flutter_auth/core/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

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
        onSecondary: Color(0xFF6c63ff), // used
        error: Colors.red,
        onError: Colors.orange,
        background: Colors.white, // used
        onBackground: Colors.grey, // used
        surface: Colors.yellow,
        onSurface: Colors.pink,
      );
}
