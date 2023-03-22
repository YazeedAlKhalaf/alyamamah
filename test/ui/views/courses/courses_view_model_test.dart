import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/ios_widget_course.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/models/time_table.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/widget_kit/widget_kit_service.dart';
import 'package:alyamamah/ui/views/courses/courses_view_model.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('coursesViewModelProvider |', () {
    test(
      'verify provider type.',
      () {
        expect(
          coursesViewModelProvider,
          isA<ChangeNotifierProvider<CoursesViewModel>>(),
        );
      },
    );
  });

  group('CoursesViewModel |', () {
    late MockApiService mockApiService;
    late PageController pageController;
    late MockWidgetKitService mockWidgetKitService;
    late MockSharedPrefsService mockSharedPrefsService;
    late CoursesViewModel coursesViewModel;

    setUp(() {
      mockApiService = MockApiService();
      pageController = PageController();
      mockWidgetKitService = MockWidgetKitService();
      mockSharedPrefsService = MockSharedPrefsService();
      coursesViewModel = CoursesViewModel(
        apiService: mockApiService,
        pageController: pageController,
        widgetKitService: mockWidgetKitService,
        sharedPrefsService: mockSharedPrefsService,
      );
    });

    const schedule1 = Schedule(
      activityCode: 'activityCode',
      activityDesc: 'activityDesc',
      campusName: 'campusName',
      campusNo: 'campusNo',
      courseCode: 'courseCode',
      courseDeleted: false,
      courseEdition: 'courseEdition',
      courseName: 'courseName',
      courseNo: 'courseNo',
      courseStatus: 'courseStatus',
      crdHrs: 'crdHrs',
      degreeCode: 'degreeCode',
      entryDate: 'entryDate',
      gender: 'gender',
      instructor: 'instructor',
      isMain: 'true',
      loadHrs: 'loadHrs',
      section: 'section',
      sectionSeq: 'sectionSeq',
      showActivity: true,
      tableIndex: 'tableIndex',
      time: 'time',
      timeSection: 'timeSection',
      timeTable: [
        TimeTable(
          days: {Day.sun, Day.mon, Day.tue, Day.wed, Day.thu},
          room: 'room',
          startTime: TimeOfDay(hour: 8, minute: 0),
          endTime: TimeOfDay(hour: 9, minute: 0),
        ),
      ],
    );

    const schedule2 = Schedule(
      activityCode: 'activityCode',
      activityDesc: 'activityDesc',
      campusName: 'campusName',
      campusNo: 'campusNo',
      courseCode: 'courseCode',
      courseDeleted: false,
      courseEdition: 'courseEdition',
      courseName: 'courseName',
      courseNo: 'courseNo',
      courseStatus: 'courseStatus',
      crdHrs: 'crdHrs',
      degreeCode: 'degreeCode',
      entryDate: 'entryDate',
      gender: 'gender',
      instructor: 'instructor',
      isMain: 'true',
      loadHrs: 'loadHrs',
      section: 'section',
      sectionSeq: 'sectionSeq',
      showActivity: true,
      tableIndex: 'tableIndex',
      time: 'time',
      timeSection: 'timeSection',
      timeTable: [
        TimeTable(
          days: {Day.sun, Day.mon, Day.tue, Day.wed, Day.thu},
          room: 'room',
          startTime: TimeOfDay(hour: 10, minute: 30),
          endTime: TimeOfDay(hour: 11, minute: 0),
        ),
      ],
    );

    group('getStudentSchedule |', () {
      test(
        'should update scheduleDays with sorted entries '
        'if the call is successful.',
        () async {
          when(
            () => mockApiService.getStudentSchedule(schedule: '20222'),
          ).thenAnswer((_) async => [schedule1, schedule2]);
          when(
            () => mockWidgetKitService.updateCoursesWidgetData(
              any(that: isA<Map<Day, List<IosWidgetCourse>>>()),
            ),
          ).thenAnswer((_) => Future.value());

          await coursesViewModel.getStudentSchedule();

          expect(coursesViewModel.scheduleDays[Day.sun], isNotEmpty);
          expect(coursesViewModel.scheduleDays[Day.sun]?.length, 2);

          expect(
            coursesViewModel.scheduleDays[Day.sun]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.sun]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            coursesViewModel.scheduleDays[Day.sun]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.sun]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(coursesViewModel.scheduleDays[Day.mon], isNotEmpty);
          expect(coursesViewModel.scheduleDays[Day.mon]?.length, 2);

          expect(
            coursesViewModel.scheduleDays[Day.mon]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.mon]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            coursesViewModel.scheduleDays[Day.mon]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.mon]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(coursesViewModel.scheduleDays[Day.tue], isNotEmpty);
          expect(coursesViewModel.scheduleDays[Day.tue]?.length, 2);

          expect(
            coursesViewModel.scheduleDays[Day.tue]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.tue]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            coursesViewModel.scheduleDays[Day.tue]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.tue]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(coursesViewModel.scheduleDays[Day.wed], isNotEmpty);
          expect(coursesViewModel.scheduleDays[Day.wed]?.length, 2);

          expect(
            coursesViewModel.scheduleDays[Day.wed]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.wed]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            coursesViewModel.scheduleDays[Day.wed]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.wed]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(coursesViewModel.scheduleDays[Day.thu], isNotEmpty);
          expect(coursesViewModel.scheduleDays[Day.thu]?.length, 2);

          expect(
            coursesViewModel.scheduleDays[Day.thu]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.thu]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            coursesViewModel.scheduleDays[Day.thu]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            coursesViewModel.scheduleDays[Day.thu]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(coursesViewModel.isBusy, false);

          verify(
            () => mockApiService.getStudentSchedule(schedule: '20222'),
          ).called(1);
          verify(
            () => mockWidgetKitService.updateCoursesWidgetData(
              any(that: isA<Map<Day, List<IosWidgetCourse>>>()),
            ),
          ).called(1);
        },
      );

      test(
        'should have isBusy and scheduleDays should have empty  '
        'if the call throws a ApiServiceException.',
        () async {
          when(
            () => mockApiService.getStudentSchedule(schedule: '20222'),
          ).thenThrow(const ApiServiceException());

          await coursesViewModel.getStudentSchedule();

          expect(coursesViewModel.isBusy, false);
          expect(coursesViewModel.scheduleDays[Day.sun], isEmpty);
          expect(coursesViewModel.scheduleDays[Day.mon], isEmpty);
          expect(coursesViewModel.scheduleDays[Day.tue], isEmpty);
          expect(coursesViewModel.scheduleDays[Day.wed], isEmpty);
          expect(coursesViewModel.scheduleDays[Day.thu], isEmpty);
        },
      );
    });
  });
}

class MockApiService extends Mock implements ApiService {}

class MockWidgetKitService extends Mock implements WidgetKitService {}

class MockSharedPrefsService extends Mock implements SharedPrefsService {}
