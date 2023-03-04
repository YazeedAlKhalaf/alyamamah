import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/models/absence_details.dart';
import 'package:alyamamah/ui/views/absences/absence_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('AbsenceDetailsView |', () {
    Widget buildTestWidget() {
      return TestMaterialApp(
        home: AbsenceDetailsView(absence: absence),
      );
    }

    group('goldens |', () {
      testGoldens(
        'verify the screen when the details are provided.',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'absence_details_view',
            devices: testDevices,
          );
        },
      );
    });
  });
}

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
    AbsenceDetails(
      activity: 'activity',
      date: 'date',
      dateH: 'dateH',
      day: 'day',
      isExcused: true,
      late: false,
      section: 'section',
      time: 'time',
      weekNo: 'weekNo',
    ),
    AbsenceDetails(
      activity: 'activity',
      date: 'date',
      dateH: 'dateH',
      day: 'day',
      isExcused: false,
      late: true,
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
