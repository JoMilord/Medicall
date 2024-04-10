import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessibilitySettingsHelper {
  static const String _fontSizeKey = 'fontSize';
  static const String _colorBlindModeKey = 'colorBlindMode';

  static Future<double> getFontSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_fontSizeKey) ?? 16.0;
  }

  static Future<void> setFontSize(double fontSize) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, fontSize);
  }

  static Future<bool> getColorBlindModeEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_colorBlindModeKey) ?? false;
  }

  static Future<void> setColorBlindModeEnabled(bool isEnabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_colorBlindModeKey, isEnabled);
  }
}
