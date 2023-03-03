import 'package:alyamamah/core/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

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
    late ThemeService themeService;
    late int notifyListenersCount = 0;

    setUp(() {
      themeService = ThemeService();

      notifyListenersCount = 0;
      themeService.addListener(() {
        notifyListenersCount++;
      });
    });

    group('setThemeMode |', () {
      test(
        'should set theme mode to dark.',
        () {
          expect(themeService.themeMode, ThemeMode.system);

          themeService.setThemeMode(ThemeMode.dark);

          expect(themeService.themeMode, ThemeMode.dark);
          expect(notifyListenersCount, 1);
        },
      );

      test(
        'should set theme mode to light.',
        () {
          expect(themeService.themeMode, ThemeMode.system);

          themeService.setThemeMode(ThemeMode.light);

          expect(themeService.themeMode, ThemeMode.light);
          expect(notifyListenersCount, 1);
        },
      );
    });
  });
}
