import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final themeServiceProvider = ChangeNotifierProvider(
  (ref) => ThemeService(
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
  ),
);

class ThemeService extends ChangeNotifier {
  final _log = Logger('ThemeService');

  final SharedPrefsService _sharedPrefsService;

  ThemeService({
    required SharedPrefsService sharedPrefsService,
  }) : _sharedPrefsService = sharedPrefsService {
    final themeMode = _sharedPrefsService.getThemeMode();
    if (themeMode != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (mode) => mode.name == themeMode,
      );
    }
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  Future<void> setThemeMode(ThemeMode themeMode) async {
    _log.info('setting the theme mode: $themeMode');

    _themeMode = themeMode;
    notifyListeners();

    _log.info('saving the theme mode: ${themeMode.name}');
    await _sharedPrefsService.saveThemeMode(themeMode);
  }
}
