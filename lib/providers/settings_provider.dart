import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme mode + language, saved on the device.
class SettingsProvider extends ChangeNotifier {
  static const _themeKey = 'theme_mode';
  static const _localeKey = 'locale_code';

  ThemeMode _themeMode = ThemeMode.system;
  Locale? _locale; // null = follow the phone language

  ThemeMode get themeMode => _themeMode;
  Locale? get locale => _locale;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(_themeKey);
    _themeMode = ThemeMode.values.firstWhere(
      (m) => m.name == theme,
      orElse: () => ThemeMode.system,
    );
    final code = prefs.getString(_localeKey);
    _locale = code == null ? null : Locale(code);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }
}
