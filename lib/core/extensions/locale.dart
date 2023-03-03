import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

extension LocaleX on Locale {
  String mapToString(BuildContext context) {
    switch (languageCode) {
      case 'ar':
        return context.s.arabic;
      case 'en':
        return context.s.english;
      default:
        return context.s.unknown;
    }
  }

  String mapToEmoji(BuildContext context) {
    switch (languageCode) {
      case 'ar':
        return '🇸🇦';
      case 'en':
        return '🇬🇧';
      default:
        return context.s.unknown;
    }
  }
}
