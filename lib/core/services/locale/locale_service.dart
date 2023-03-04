import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final localeServiceProvider = ChangeNotifierProvider(
  (ref) => LocaleService(
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
  ),
);

class LocaleService extends ChangeNotifier {
  final _log = Logger('LocaleService');

  final SharedPrefsService _sharedPrefsService;

  LocaleService({
    required SharedPrefsService sharedPrefsService,
  }) : _sharedPrefsService = sharedPrefsService {
    final localeLanguageCode = _sharedPrefsService.getLocale();
    _log.info('initializing the locale: $localeLanguageCode');
    if (localeLanguageCode != null) {
      _locale = Locale(localeLanguageCode);
    }
  }

  Locale? _locale;
  Locale? get locale => _locale;
  Future<void> setLocale(Locale? locale) async {
    _log.info('setting the locale: $locale');

    _locale = locale;
    notifyListeners();

    if (locale != null) {
      _log.info('saving the locale: ${locale.languageCode}');
      await _sharedPrefsService.saveLocale(locale.languageCode);
    } else {
      _log.info('deleting the locale because it is being set to null.');
      await _sharedPrefsService.deleteLocale();
    }
  }
}
