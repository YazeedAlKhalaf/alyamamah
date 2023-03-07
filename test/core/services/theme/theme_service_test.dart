import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('themeServiceProvider |', () {
    test(
      'verify the provider type.',
      () {
        expect(
          themeServiceProvider,
          isA<ChangeNotifierProvider<ThemeService>>(),
        );
      },
    );
  });

  group('ThemeService |', () {
    late MockSharedPrefsService mockSharedPrefsService;
    late ThemeService themeService;
    late int notifyListenersCount = 0;

    setUp(() {
      mockSharedPrefsService = MockSharedPrefsService();
      when(() => mockSharedPrefsService.getThemeMode()).thenReturn(null);
      themeService = ThemeService(
        sharedPrefsService: mockSharedPrefsService,
      );

      verify(() => mockSharedPrefsService.getThemeMode()).called(1);

      notifyListenersCount = 0;
      themeService.addListener(() {
        notifyListenersCount++;
      });
    });

    group('constructor initialization |', () {
      test(
        'should initialize theme mode to system '
        'if the getThemeMode returns null.',
        () {
          when(() => mockSharedPrefsService.getThemeMode()).thenReturn(null);
          themeService = ThemeService(
            sharedPrefsService: mockSharedPrefsService,
          );

          expect(themeService.themeMode, ThemeMode.system);
        },
      );

      test(
        'should initialize theme mode to light '
        'if the getThemeMode returns light.',
        () {
          when(() => mockSharedPrefsService.getThemeMode()).thenReturn('light');
          themeService = ThemeService(
            sharedPrefsService: mockSharedPrefsService,
          );

          expect(themeService.themeMode, ThemeMode.light);
        },
      );
    });

    group('setThemeMode |', () {
      test(
        'should set theme mode to dark.',
        () async {
          expect(themeService.themeMode, ThemeMode.system);

          when(() => mockSharedPrefsService.saveThemeMode(ThemeMode.dark))
              .thenAnswer((_) => Future.value());

          await themeService.setThemeMode(ThemeMode.dark);

          expect(themeService.themeMode, ThemeMode.dark);
          expect(notifyListenersCount, 1);

          verify(() => mockSharedPrefsService.saveThemeMode(ThemeMode.dark))
              .called(1);
        },
      );

      test(
        'should set theme mode to light.',
        () {
          expect(themeService.themeMode, ThemeMode.system);

          when(() => mockSharedPrefsService.saveThemeMode(ThemeMode.light))
              .thenAnswer((_) => Future.value());

          themeService.setThemeMode(ThemeMode.light);

          expect(themeService.themeMode, ThemeMode.light);
          expect(notifyListenersCount, 1);

          verify(() => mockSharedPrefsService.saveThemeMode(ThemeMode.light))
              .called(1);
        },
      );
    });
  });
}

class MockSharedPrefsService extends Mock implements SharedPrefsService {}
