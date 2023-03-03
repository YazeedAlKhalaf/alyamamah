import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeServiceProvider = ChangeNotifierProvider(
  (ref) => LocaleService(),
);

class LocaleService extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;
  void setLocale(Locale? locale) {
    _locale = locale;
    notifyListeners();
  }
}
