import 'package:alyamamah/core/extensions/locale.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LanguageInterceptor extends Interceptor {
  final SharedPrefsService _sharedPrefsService;

  LanguageInterceptor({
    required SharedPrefsService sharedPrefsService,
  }) : _sharedPrefsService = sharedPrefsService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final locale = Locale(_sharedPrefsService.getLocale() ?? 'en');
    final changeLanguageLocale = locale.mapToChangeLanguageLocale();
    options.headers['langId'] = changeLanguageLocale.localeNumber - 1;

    handler.next(options);
  }
}
