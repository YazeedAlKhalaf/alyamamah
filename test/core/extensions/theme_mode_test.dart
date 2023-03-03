import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/test_material_app.dart';

void main() {
  group('ThemeModeX |', () {
    group('mapToString |', () {
      Widget buildTestWidget() {
        return TestMaterialApp(
          home: Scaffold(
            body: Container(),
          ),
        );
      }

      testWidgets(
        'returns the correct string for ThemeMode.light.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(
            ThemeMode.light.mapToString(context),
            context.s.light,
          );
        },
      );

      testWidgets(
        'returns the correct string for ThemeMode.dark.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(
            ThemeMode.dark.mapToString(context),
            context.s.dark,
          );
        },
      );

      testWidgets(
        'returns the correct string for ThemeMode.system.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(
            ThemeMode.system.mapToString(context),
            context.s.system,
          );
        },
      );
    });

    group('mapToEmoji |', () {
      test(
        'returns the correct emoji for ThemeMode.light.',
        () {
          expect(
            ThemeMode.light.mapToEmoji(),
            '☀️',
          );
        },
      );

      test(
        'returns the correct emoji for ThemeMode.dark.',
        () {
          expect(
            ThemeMode.dark.mapToEmoji(),
            '🌙',
          );
        },
      );

      test(
        'returns the correct emoji for ThemeMode.system.',
        () {
          expect(
            ThemeMode.system.mapToEmoji(),
            '🌍',
          );
        },
      );
    });
  });
}
