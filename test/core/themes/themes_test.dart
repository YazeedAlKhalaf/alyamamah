import 'package:alyamamah/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Themes |', () {
    test(
      'verify light theme.',
      () {
        expect(Themes.light, lightTheme);
      },
    );

    test(
      'verify dark theme.',
      () {
        expect(Themes.dark, darkTheme);
      },
    );
  });

  group('lightTheme |', () {
    test(
      'verify useMaterial3.',
      () {
        final theme = lightTheme;
        expect(theme.useMaterial3, true);
      },
    );

    test(
      'verify colorScheme.',
      () {
        final theme = lightTheme;
        expect(
          theme.colorScheme,
          ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: const Color(0xffF68939),
          ),
        );
      },
    );

    group('appBarTheme |', () {
      test(
        'verify centerTitle.',
        () {
          final appBarTheme = lightTheme.appBarTheme;
          expect(appBarTheme.centerTitle, true);
        },
      );
    });
  });

  group('darkTheme |', () {
    test(
      'verify useMaterial3.',
      () {
        final theme = darkTheme;
        expect(theme.useMaterial3, true);
      },
    );

    test(
      'verify colorScheme.',
      () {
        final theme = darkTheme;
        expect(
          theme.colorScheme,
          ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color(0xffF68939),
          ),
        );
      },
    );

    group('appBarTheme |', () {
      test(
        'verify centerTitle.',
        () {
          final appBarTheme = darkTheme.appBarTheme;
          expect(appBarTheme.centerTitle, true);
        },
      );
    });
  });
}
