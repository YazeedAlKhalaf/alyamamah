import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/models/absence_details.dart';
import 'package:alyamamah/ui/views/absences/absences_view.dart';
import 'package:alyamamah/ui/views/absences/absences_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('AbsencesView |', () {
    late MockAbsencesViewModel mockAbsencesViewModel;

    setUp(() {
      mockAbsencesViewModel = MockAbsencesViewModel();

      when(() => mockAbsencesViewModel.getAbsences())
          .thenAnswer((_) => Future.value());
    });

    tearDown(() {
      verify(() => mockAbsencesViewModel.getAbsences()).called(1);
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          absencesViewModelProvider
              .overrideWith((ref) => mockAbsencesViewModel),
        ],
        home: const AbsencesView(),
      );
    }

    testWidgets(
      'should navigate to absences details view '
      'if list tile is tapped.',
      (WidgetTester tester) async {
        when(() => mockAbsencesViewModel.isBusy).thenReturn(false);
        when(() => mockAbsencesViewModel.absences).thenReturn([absence]);
        when(() => mockAbsencesViewModel.navigateToAbsenceDetails(absence))
            .thenAnswer((_) => Future.value());

        await tester.pumpWidget(buildTestWidget());

        await tester.tap(find.byType(ListTile));
        await tester.pumpAndSettle();

        verify(() => mockAbsencesViewModel.navigateToAbsenceDetails(absence))
            .called(1);
      },
    );

    group('goldens |', () {
      testGoldens(
        'verify view if isBusy is true.',
        (WidgetTester tester) async {
          when(() => mockAbsencesViewModel.isBusy).thenReturn(true);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'absences_view.busy',
            devices: testDevices,
            customPump: (WidgetTester tester) async {
              await tester.pump(const Duration(milliseconds: 150));
            },
          );
        },
      );

      testGoldens(
        'verify view if isBusy is false and absences is empty.',
        (WidgetTester tester) async {
          when(() => mockAbsencesViewModel.isBusy).thenReturn(false);
          when(() => mockAbsencesViewModel.absences).thenReturn([]);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'absences_view.not_busy.absences_empty',
            devices: testDevices,
          );
        },
      );

      testGoldens(
        'verify view if isBusy is false and absences is not empty.',
        (WidgetTester tester) async {
          when(() => mockAbsencesViewModel.isBusy).thenReturn(false);
          when(() => mockAbsencesViewModel.absences).thenReturn([absence]);

          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'absences_view.not_busy.absences_not_empty',
            devices: testDevices,
          );
        },
      );
    });
  });
}

class MockAbsencesViewModel extends Mock implements AbsencesViewModel {}

final absence = Absence(
  details: [
    AbsenceDetails(
      activity: 'activity',
      date: 'date',
      dateH: 'dateH',
      day: 'day',
      isExcused: false,
      late: false,
      section: 'section',
      time: 'time',
      weekNo: 'weekNo',
    ),
  ],
  activity: 'activity',
  campus: 'campus',
  countAbsence: '2',
  countLate: '2',
  courseCode: 'courseCode',
  courseName: 'courseName',
  courseNo: 'courseNo',
  date: 'date',
  day: 'day',
  index: '',
  isExcused: false,
  late: false,
  section: '',
  sectionSeq: '',
  time: '',
  totalAbsencePercent: '5.41',
  warningLevel: '',
  warningPercent: '',
  weekNo: '',
);
