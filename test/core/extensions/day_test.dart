import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/day.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/test_material_app.dart';

void main() {
  group('DayX |', () {
    group('mapToString |', () {
      Widget buildTestWidget() {
        return TestMaterialApp(
          home: Scaffold(
            body: Container(),
          ),
        );
      }

      testWidgets(
        'returns the correct string for Day.sun.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Day.sun.mapToString(context), context.s.sun);
        },
      );

      testWidgets(
        'returns the correct string for Day.mon.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Day.mon.mapToString(context), context.s.mon);
        },
      );

      testWidgets(
        'returns the correct string for Day.tue.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Day.tue.mapToString(context), context.s.tue);
        },
      );

      testWidgets(
        'returns the correct string for Day.wed.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Day.wed.mapToString(context), context.s.wed);
        },
      );

      testWidgets(
        'returns the correct string for Day.thu.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Day.thu.mapToString(context), context.s.thu);
        },
      );

      testWidgets(
        'returns the correct string for Day.fri.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Day.fri.mapToString(context), context.s.fri);
        },
      );

      testWidgets(
        'returns the correct string for Day.sat.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Day.sat.mapToString(context), context.s.sat);
        },
      );
    });
  });
}
