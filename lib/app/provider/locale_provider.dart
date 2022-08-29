import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>(
  (ref) => LocaleNotifier(),
);

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en'));

  void toggleLocale() {
    switch (state.languageCode) {
      case 'en':
        state = const Locale('ar');
        break;
      case 'ar':
      default:
        state = const Locale('en');
        break;
    }
  }
}
