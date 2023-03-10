import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/home/home_view.dart';
import 'package:alyamamah/ui/views/home/home_view_model.dart';
import 'package:alyamamah/ui/views/home/models/schedule_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils/test_devices.dart';
import '../../../test_utils/test_material_app.dart';

void main() {
  group('HomeView |', () {
    late PageController pageController;
    late MockHomeViewModel mockHomeViewModel;

    setUp(() {
      pageController = PageController();
      mockHomeViewModel = MockHomeViewModel();
      when(
        () => mockHomeViewModel.getStudentSchedule(),
      ).thenAnswer((_) => Future.value());
      when(() => mockHomeViewModel.scheduleDays).thenReturn({});
    });

    Widget buildTestWidget() {
      return TestMaterialApp(
        overrides: [
          homeViewModelProvider.overrideWith((ref) => mockHomeViewModel),
        ],
        home: const HomeView(),
      );
    }

    testWidgets(
      'verify app bar title text.',
      (WidgetTester tester) async {
        when(() => mockHomeViewModel.isBusy).thenReturn(false);
        when(
          () => mockHomeViewModel.pageController,
        ).thenReturn(pageController);
        when(
          () => mockHomeViewModel.scheduleDays,
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
          when(() => mockHomeViewModel.isBusy).thenReturn(false);
          when(
            () => mockHomeViewModel.pageController,
          ).thenReturn(pageController);
          when(
            () => mockHomeViewModel.scheduleDays,
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
          when(() => mockHomeViewModel.isBusy).thenReturn(false);
          when(
            () => mockHomeViewModel.pageController,
          ).thenReturn(pageController);
          when(
            () => mockHomeViewModel.scheduleDays,
          ).thenReturn({
            Day.sun: [
              ScheduleEntry(
                startTime: const TimeOfDay(hour: 9, minute: 0),
                endTime: const TimeOfDay(hour: 10, minute: 0),
                room: 'room',
                activityDesc: 'activityDesc',
                courseName: 'courseName',
                courseCode: 'courseCode',
              ),
              ScheduleEntry(
                startTime: const TimeOfDay(hour: 10, minute: 20),
                endTime: const TimeOfDay(hour: 12, minute: 20),
                room: 'room',
                activityDesc: 'activityDesc',
                courseName: 'courseName',
                courseCode: 'courseCode',
              ),
            ],
          });
          await tester.pumpWidget(buildTestWidget());

          await multiScreenGolden(
            tester,
            'home_view.isBusy_false_schedule_days_not_empty_on_sunday',
            devices: testDevices,
          );
        },
      );

      testGoldens(
        'renders correctly when isBusy is true.',
        (WidgetTester tester) async {
          when(() => mockHomeViewModel.isBusy).thenReturn(true);
          when(
            () => mockHomeViewModel.pageController,
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

class MockHomeViewModel extends Mock implements HomeViewModel {}
