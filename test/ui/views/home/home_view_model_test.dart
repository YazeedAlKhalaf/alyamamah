import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/models/time_table.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/ui/views/home/home_view_model.dart';
import 'package:alyamamah/ui/views/home/models/schedule_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('homeViewModelProvider |', () {
    test(
      'verify provider type.',
      () {
        expect(
          homeViewModelProvider,
          isA<ChangeNotifierProvider<HomeViewModel>>(),
        );
      },
    );
  });

  group('HomeViewModel |', () {
    late MockApiService mockApiService;
    late PageController pageController;
    late HomeViewModel homeViewModel;

    setUp(() {
      mockApiService = MockApiService();
      pageController = PageController();
      homeViewModel = HomeViewModel(
        apiService: mockApiService,
        pageController: pageController,
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

          await homeViewModel.getStudentSchedule();

          expect(homeViewModel.scheduleDays[Day.sun], isNotEmpty);
          expect(homeViewModel.scheduleDays[Day.sun]?.length, 2);

          expect(
            homeViewModel.scheduleDays[Day.sun]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.sun]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            homeViewModel.scheduleDays[Day.sun]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.sun]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(homeViewModel.scheduleDays[Day.mon], isNotEmpty);
          expect(homeViewModel.scheduleDays[Day.mon]?.length, 2);

          expect(
            homeViewModel.scheduleDays[Day.mon]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.mon]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            homeViewModel.scheduleDays[Day.mon]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.mon]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(homeViewModel.scheduleDays[Day.tue], isNotEmpty);
          expect(homeViewModel.scheduleDays[Day.tue]?.length, 2);

          expect(
            homeViewModel.scheduleDays[Day.tue]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.tue]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            homeViewModel.scheduleDays[Day.tue]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.tue]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(homeViewModel.scheduleDays[Day.wed], isNotEmpty);
          expect(homeViewModel.scheduleDays[Day.wed]?.length, 2);

          expect(
            homeViewModel.scheduleDays[Day.wed]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.wed]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            homeViewModel.scheduleDays[Day.wed]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.wed]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(homeViewModel.scheduleDays[Day.thu], isNotEmpty);
          expect(homeViewModel.scheduleDays[Day.thu]?.length, 2);

          expect(
            homeViewModel.scheduleDays[Day.thu]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 8, minute: 0),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.thu]?[0],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 9, minute: 0),
            ),
          );

          expect(
            homeViewModel.scheduleDays[Day.thu]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.startTime,
              'startTime',
              const TimeOfDay(hour: 10, minute: 30),
            ),
          );
          expect(
            homeViewModel.scheduleDays[Day.thu]?[1],
            isA<ScheduleEntry>().having(
              (p0) => p0.endTime,
              'endTime',
              const TimeOfDay(hour: 11, minute: 0),
            ),
          );

          expect(homeViewModel.isBusy, false);
        },
      );

      test(
        'should have isBusy and scheduleDays should have empty  '
        'if the call throws a ApiServiceException.',
        () async {
          when(
            () => mockApiService.getStudentSchedule(schedule: '20222'),
          ).thenThrow(const ApiServiceException());

          await homeViewModel.getStudentSchedule();

          expect(homeViewModel.isBusy, false);
          expect(homeViewModel.scheduleDays[Day.sun], isEmpty);
          expect(homeViewModel.scheduleDays[Day.mon], isEmpty);
          expect(homeViewModel.scheduleDays[Day.tue], isEmpty);
          expect(homeViewModel.scheduleDays[Day.wed], isEmpty);
          expect(homeViewModel.scheduleDays[Day.thu], isEmpty);
        },
      );
    });
  });
}

class MockApiService extends Mock implements ApiService {}
