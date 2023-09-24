import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils/test_material_app.dart';

void main() {
  group('Utils |', () {
    group('generateSemesterRange |', () {
      test(
        'should return empty list '
        'if start or end is not in the format of YYYYX.',
        () {
          expect(Utils.generateSemesterRange('2021', '20211'), []);
          expect(Utils.generateSemesterRange('20211', '2021'), []);
          expect(Utils.generateSemesterRange('2', '2'), []);
        },
      );

      test(
        'should return list with 2 values '
        'if end is after start by 1 semester.',
        () {
          expect(
            Utils.generateSemesterRange('20221', '20222'),
            ['20221', '20222'],
          );
        },
      );

      test(
        'should return list with 1 value '
        'if end is the same as start.',
        () {
          expect(
            Utils.generateSemesterRange('20221', '20221'),
            ['20221'],
          );
        },
      );

      test(
        'should return list with 5 values '
        'if end is in the next year of start.',
        () {
          expect(
            Utils.generateSemesterRange('20221', '20232'),
            ['20221', '20222', '20223', '20231', '20232'],
          );
        },
      );

      test(
        'should return list with no values '
        'if end is before start.',
        () {
          expect(
            Utils.generateSemesterRange('20232', '20221'),
            [],
          );
        },
      );
    });

    group('semesterToReadable |', () {
      Widget buildTestWidget() {
        return const TestMaterialApp(
          home: Scaffold(),
        );
      }

      testWidgets(
        'should get empty string if the semester is less than 5.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Utils.semesterToReadable(context, '2021'), '');
        },
      );

      testWidgets(
        'should get empty string if the semester is more than 5 '
        'and the last digit is not 1, 2, or 3.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(Utils.semesterToReadable(context, '20215'), '');
        },
      );

      testWidgets(
        'should get first_semester_year1_year2 string if the semester is more than 5 '
        'and the last digit is 1.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(
            Utils.semesterToReadable(context, '20211'),
            context.s.first_semester_year1_year2('2021', '2022'),
          );
        },
      );

      testWidgets(
        'should get second_semester_year1_year2 string if the semester is more than 5 '
        'and the last digit is 1.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(
            Utils.semesterToReadable(context, '20212'),
            context.s.second_semester_year1_year2('2021', '2022'),
          );
        },
      );

      testWidgets(
        'should get summer_semester_year1_year2 string if the semester is more than 5 '
        'and the last digit is 1.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());
          await tester.pumpAndSettle();

          final context = tester.element(find.byType(Scaffold));

          expect(
            Utils.semesterToReadable(context, '20213'),
            context.s.summer_semester_year1_year2('2021', '2022'),
          );
        },
      );
    });
  });
}
