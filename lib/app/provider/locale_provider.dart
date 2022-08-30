import 'package:alyamamah/app/misc/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>(
  (ref) => LocaleNotifier(),
);

class LocaleNotifier extends StateNotifier<Locale> {
  static final logger = Logger('LocaleNotifier');

  LocaleNotifier() : super(const Locale('en'));

  Future<void> updateLocale() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final localeLanguageCode = sharedPrefs.getString(
      Constants.localeLanguageCodeKey,
    );
    logger.fine('got language as: $localeLanguageCode');

    state = Locale(localeLanguageCode ?? 'en');
  }

  Future<void> toggleLocale() async {
    late final String localeCode;
    switch (state.languageCode) {
      case 'en':
        localeCode = 'ar';
        state = const Locale('ar');
        break;
      case 'ar':
      default:
        localeCode = 'en';
        state = const Locale('en');
        break;
    }

    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString(Constants.localeLanguageCodeKey, localeCode);
    logger.fine('language changed to: $localeCode');
  }
}
