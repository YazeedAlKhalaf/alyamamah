import 'package:alyamamah/core/services/locale/locale_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
    late MockSharedPrefsService mockSharedPrefsService;
    late LocaleService localeService;
    late ProviderContainer container;

    setUp(() {
      mockSharedPrefsService = MockSharedPrefsService();
      when(() => mockSharedPrefsService.getLocale()).thenReturn(null);

      localeService = LocaleService(
        sharedPrefsService: mockSharedPrefsService,
      );
      container = ProviderContainer(
        overrides: [
          localeServiceProvider.overrideWith((ref) => localeService),
        ],
      );
    });

    test(
      'should get null locale by default if getLocale returns null.',
      () {
        when(() => mockSharedPrefsService.getLocale()).thenReturn(null);
        localeService = LocaleService(
          sharedPrefsService: mockSharedPrefsService,
        );
        final service = container.read(localeServiceProvider);

        expect(service.locale, isNull);
      },
    );

    test(
      'should get not null locale by default if getLocale returns not null.',
      () {
        when(() => mockSharedPrefsService.getLocale()).thenReturn('ar');
        localeService = LocaleService(
          sharedPrefsService: mockSharedPrefsService,
        );
        final service = container.read(localeServiceProvider);

        expect(service.locale, const Locale('ar'));
      },
    );

    test(
      'should get locale if set.',
      () {
        when(() => mockSharedPrefsService.saveLocale('en'))
            .thenAnswer((_) => Future.value());
        final service = container.read(localeServiceProvider);

        service.setLocale(const Locale('en'));

        expect(service.locale, const Locale('en'));
      },
    );

    test(
      'should get null locale after setting it if it is reset to null.',
      () {
        when(() => mockSharedPrefsService.saveLocale('en'))
            .thenAnswer((_) => Future.value());
        when(() => mockSharedPrefsService.deleteLocale())
            .thenAnswer((_) => Future.value());

        final service = container.read(localeServiceProvider);

        service.setLocale(const Locale('en'));

        expect(service.locale, const Locale('en'));

        service.setLocale(null);

        expect(service.locale, isNull);
      },
    );
  });
}

class MockSharedPrefsService extends Mock implements SharedPrefsService {}
