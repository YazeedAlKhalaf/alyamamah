import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/test_material_app.dart';

void main() {
  group('LocaleX |', () {
    Widget buildTestWidget() {
      return TestMaterialApp(
        home: Scaffold(
          body: Container(),
        ),
      );
    }

    group('mapToString |', () {
      testWidgets(
        'returns the correct string for "ar".',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(const Locale('ar').mapToString(context), context.s.arabic);
        },
      );

      testWidgets(
        'returns the correct string for "en".',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(const Locale('en').mapToString(context), context.s.english);
        },
      );

      testWidgets(
        'returns the correct string for "fr".',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(const Locale('fr').mapToString(context), context.s.unknown);
        },
      );
    });

    group('mapToEmoji |', () {
      testWidgets(
        'returns the correct string for "ar".',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(const Locale('ar').mapToEmoji(context), '🇸🇦');
        },
      );

      testWidgets(
        'returns the correct string for "en".',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(const Locale('en').mapToEmoji(context), '🇬🇧');
        },
      );

      testWidgets(
        'returns the correct string for "fr".',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(const Locale('fr').mapToEmoji(context), context.s.unknown);
        },
      );
    });
  });
}
