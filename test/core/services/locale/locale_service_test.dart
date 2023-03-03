import 'package:alyamamah/core/services/locale/locale_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('localeServiceProvider |', () {
    test('should get a ChangeNotifierProvider<LocaleService>.', () {
      expect(
        localeServiceProvider,
        isA<ChangeNotifierProvider<LocaleService>>(),
      );
    });
  });

  group('LocaleService |', () {
    test(
      'should get null locale by default.',
      () {
        final container = ProviderContainer();
        final service = container.read(localeServiceProvider);

        expect(service.locale, isNull);
      },
    );

    test(
      'should get locale if set.',
      () {
        final container = ProviderContainer();
        final service = container.read(localeServiceProvider);

        service.setLocale(const Locale('en'));

        expect(service.locale, const Locale('en'));
      },
    );

    test(
      'should get null locale after setting it if it is reset to null.',
      () {
        final container = ProviderContainer();
        final service = container.read(localeServiceProvider);

        service.setLocale(const Locale('en'));

        expect(service.locale, const Locale('en'));

        service.setLocale(null);

        expect(service.locale, isNull);
      },
    );
  });
}
