import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/courses/courses_view.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('CoursesView |', () {
    late PageController pageController;
    late MockCoursesViewModel mockCoursesViewModel;

    setUp(() {
      pageController = PageController();
      mockCoursesViewModel = MockCoursesViewModel();
      when(
        () => mockCoursesViewModel.getStudentSchedule(),
      ).thenAnswer((_) => Future.value());
      when(() => mockCoursesViewModel.scheduleDays).thenReturn({});
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          coursesViewModelProvider.overrideWith((ref) => mockCoursesViewModel),
        ],
        home: const CoursesView(),
      );
    }

    testWidgets(
      'verify app bar title text.',
      (WidgetTester tester) async {
        when(() => mockCoursesViewModel.isBusy).thenReturn(false);
        when(() => mockCoursesViewModel.isRamadan).thenReturn(false);
        when(
          () => mockCoursesViewModel.pageController,
        ).thenReturn(pageController);
        when(
          () => mockCoursesViewModel.scheduleDays,
        ).thenReturn({});

        await tester.pumpWidget(buildTestWidget());
        await tester.pumpAndSettle();

        final appBar = find.byType(AppBar);
        expect(appBar, findsOneWidget);

        final appBarWidget = tester.widget<AppBar>(appBar);
        expect(appBarWidget.title, isA<Text>());

        final context = tester.element(appBar);

        final appBarTitle = appBarWidget.title as Text;
        expect(appBarTitle.data, context.s.my_courses);
      },
    );

    group('goldens |', () {
      testGoldens(
        'renders correctly when isBusy is false and scheduleDays is empty.',
        (WidgetTester tester) async {
          when(() => mockCoursesViewModel.isBusy).thenReturn(false);
          when(() => mockCoursesViewModel.isRamadan).thenReturn(false);
          when(
            () => mockCoursesViewModel.pageController,
          ).thenReturn(pageController);
          when(
            () => mockCoursesViewModel.scheduleDays,
          ).thenReturn({});
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'home_view.isBusy_false_schedule_days_empty',
            devices: testDevices,
          );
        },
      );

      testGoldens(
        'renders correctly when isBusy is false '
        'and scheduleDays is not empty on sunday.',
        (WidgetTester tester) async {
          when(() => mockCoursesViewModel.isBusy).thenReturn(false);
          when(() => mockCoursesViewModel.isRamadan).thenReturn(true);
          when(
            () => mockCoursesViewModel.pageController,
          ).thenReturn(pageController);
          when(
            () => mockCoursesViewModel.scheduleDays,
          ).thenReturn({
            Day.sun: [
              ScheduleEntry(
                startTime: const TimeOfDay(hour: 9, minute: 0),
                endTime: const TimeOfDay(hour: 10, minute: 0),
                room: 'room',
                activityDesc: 'activityDesc',
                courseName: 'courseName',
                courseCode: 'courseCode',
                instructor: 'instructor',
                creditHours: 'creditHours',
                campusName: 'campusName',
                courseDeleted: false,
                section: 'section',
              ),
              ScheduleEntry(
                startTime: const TimeOfDay(hour: 10, minute: 20),
                endTime: const TimeOfDay(hour: 12, minute: 20),
                room: 'room',
                activityDesc: 'activityDesc',
                courseName: 'courseName',
                courseCode: 'courseCode',
                instructor: 'instructor',
                creditHours: 'creditHours',
                campusName: 'campusName',
                courseDeleted: false,
                section: 'section',
              ),
            ],
          });
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'home_view.isBusy_false_schedule_days_not_empty_on_sunday',
            devices: testDevices,
            customPump: (WidgetTester tester) async {
              await tester.pump(const Duration(milliseconds: 150));
            },
          );
        },
      );

      testGoldens(
        'renders correctly when isBusy is true.',
        (WidgetTester tester) async {
          when(() => mockCoursesViewModel.isBusy).thenReturn(true);
          when(() => mockCoursesViewModel.isRamadan).thenReturn(false);
          when(
            () => mockCoursesViewModel.pageController,
          ).thenReturn(pageController);
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'home_view.isBusy_true',
            devices: testDevices,
            customPump: (WidgetTester tester) async {
              await tester.pump(const Duration(milliseconds: 150));
            },
          );
        },
      );
    });
  });
}

class MockCoursesViewModel extends Mock implements CoursesViewModel {}
