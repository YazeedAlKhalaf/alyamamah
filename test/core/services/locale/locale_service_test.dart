import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
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
    late MockApiService mockApiService;
    late MockYURouter mockYURouter;
    late LocaleService localeService;
    late ProviderContainer container;

    setUp(() {
      mockSharedPrefsService = MockSharedPrefsService();
      when(() => mockSharedPrefsService.getLocale()).thenReturn(null);

      mockApiService = MockApiService();
      mockYURouter = MockYURouter();

      localeService = LocaleService(
        sharedPrefsService: mockSharedPrefsService,
        apiService: mockApiService,
        yuRouter: mockYURouter,
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
          apiService: mockApiService,
          yuRouter: mockYURouter,
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
          apiService: mockApiService,
          yuRouter: mockYURouter,
        );
        final service = container.read(localeServiceProvider);

        expect(service.locale, const Locale('ar'));
      },
    );

    test(
      'should get locale if set and changeLanguage returns true.',
      () async {
        when(() => mockSharedPrefsService.saveLocale('en'))
            .thenAnswer((_) => Future.value());
        when(
          () => mockApiService.changeLanguage(
            changeLanguageLocale: ChangeLanguageLocale.english,
          ),
        ).thenAnswer((_) => Future.value(true));
        when(
          () => mockYURouter.pushAndPopUntil(
            const StartupRoute(),
            predicate: any(named: 'predicate'),
          ),
        ).thenAnswer((_) => Future.value());

        final service = container.read(localeServiceProvider);

        await service.setLocale(const Locale('en'));

        verify(() => mockSharedPrefsService.saveLocale('en')).called(1);
        verify(
          () => mockApiService.changeLanguage(
            changeLanguageLocale: ChangeLanguageLocale.english,
          ),
        ).called(1);
        verify(
          () => mockYURouter.pushAndPopUntil(
            const StartupRoute(),
            predicate: any(named: 'predicate'),
          ),
        ).called(1);

        expect(service.locale, const Locale('en'));
      },
    );

    test(
      'should get locale if set and changeLanguage returns false.',
      () async {
        when(() => mockSharedPrefsService.saveLocale('en'))
            .thenAnswer((_) => Future.value());
        when(
          () => mockApiService.changeLanguage(
            changeLanguageLocale: ChangeLanguageLocale.english,
          ),
        ).thenAnswer((_) => Future.value(false));

        final service = container.read(localeServiceProvider);

        await service.setLocale(const Locale('en'));

        verify(() => mockSharedPrefsService.saveLocale('en')).called(1);
        verify(
          () => mockApiService.changeLanguage(
            changeLanguageLocale: ChangeLanguageLocale.english,
          ),
        ).called(1);

        expect(service.locale, const Locale('en'));
      },
    );

    test(
      'should get null locale after setting it if it is reset to null.',
      () async {
        when(() => mockSharedPrefsService.saveLocale('en'))
            .thenAnswer((_) => Future.value());
        when(
          () => mockApiService.changeLanguage(
            changeLanguageLocale: ChangeLanguageLocale.english,
          ),
        ).thenAnswer((_) => Future.value(false));
        when(() => mockSharedPrefsService.deleteLocale())
            .thenAnswer((_) => Future.value());

        final service = container.read(localeServiceProvider);

        await service.setLocale(const Locale('en'));
        expect(service.locale, const Locale('en'));

        await service.setLocale(null);
        expect(service.locale, isNull);

        verify(() => mockSharedPrefsService.saveLocale('en')).called(1);
        verify(
          () => mockApiService.changeLanguage(
            changeLanguageLocale: ChangeLanguageLocale.english,
          ),
        ).called(1);
        verify(() => mockSharedPrefsService.deleteLocale()).called(1);
      },
    );
  });
}

class MockSharedPrefsService extends Mock implements SharedPrefsService {}

class MockApiService extends Mock implements ApiService {}

class MockYURouter extends Mock implements YURouter {}
