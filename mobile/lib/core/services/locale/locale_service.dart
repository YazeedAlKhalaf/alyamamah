import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final localeServiceProvider = ChangeNotifierProvider(
  (ref) => LocaleService(
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    apiService: ref.read(apiServiceProvider),
    yuRouter: ref.read(yuRouterProvider),
  ),
);

class LocaleService extends ChangeNotifier {
  final _log = Logger('LocaleService');

  final SharedPrefsService _sharedPrefsService;
  final ApiService _apiService;
  final YURouter _yuRouter;

  LocaleService({
    required SharedPrefsService sharedPrefsService,
    required ApiService apiService,
    required YURouter yuRouter,
  })  : _sharedPrefsService = sharedPrefsService,
        _apiService = apiService,
        _yuRouter = yuRouter {
    final localeLanguageCode = _sharedPrefsService.getLocale();
    _log.info('initializing the locale: $localeLanguageCode');
    if (localeLanguageCode != null) {
      _locale = Locale(localeLanguageCode);
    }
  }

  Locale? _locale;
  Locale? get locale => _locale;
  Future<void> setLocale(Locale? locale,
      {bool onlyChangeLocale = false}) async {
    _log.info('setting the locale: $locale');

    _locale = locale;
    notifyListeners();

    if (locale != null) {
      _log.info('saving the locale: ${locale.languageCode}');
      await _sharedPrefsService.saveLocale(locale.languageCode);
      if (onlyChangeLocale) return;

      _log.info('changing the language on the server.');
      final changeLanguageLocale = locale.mapToChangeLanguageLocale();
      final loggedIn = await _apiService.changeLanguage(
        changeLanguageLocale: changeLanguageLocale,
      );

      if (loggedIn) {
        await _yuRouter.pushAndPopUntil(
          const StartupRoute(),
          predicate: (_) => false,
        );
      }
    } else {
      _log.info('deleting the locale because it is being set to null.');
      await _sharedPrefsService.deleteLocale();
    }
  }
}
