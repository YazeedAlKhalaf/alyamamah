import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

extension ThemeModeX on ThemeMode {
  String mapToString(BuildContext context) {
    switch (this) {
      case ThemeMode.light:
        return context.s.light;
      case ThemeMode.dark:
        return context.s.dark;
      case ThemeMode.system:
        return context.s.system;
    }
  }

  String mapToEmoji() {
    switch (this) {
      case ThemeMode.light:
        return '☀️';
      case ThemeMode.dark:
        return '🌙';
      case ThemeMode.system:
        return '🌍';
    }
  }
}
