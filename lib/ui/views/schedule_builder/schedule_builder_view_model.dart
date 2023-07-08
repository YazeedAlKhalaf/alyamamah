import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/core/models/time_table.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/schedule_builder/models/conflict.dart';
import 'package:alyamamah/ui/views/schedule_builder/models/offered_courses_schedule.dart';
import 'package:alyamamah/ui/views/schedule_builder/schedule_builder_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final scheduleBuilderViewModelProvider =
    StateNotifierProvider<ScheduleBuilderViewModel, ScheduleBuilderViewState>(
  (ref) => ScheduleBuilderViewModel(
    apiService: ref.read(apiServiceProvider),
  ),
);

class ScheduleBuilderViewModel extends StateNotifier<ScheduleBuilderViewState> {
  final _log = Logger('ScheduleBuilderViewModel');

  final ApiService _apiService;

  ScheduleBuilderViewModel({
    required ApiService apiService,
  })  : _apiService = apiService,
        super(ScheduleBuilderViewState());

  void setSelectedScheduleIndex(int index) {
    state = state.copyWith(selectedScheduleIndex: index);
  }

  void generateSuggestedSchedules({
    required List<OfferedCourse> selectedCourses,
  }) {
    final selectedCoursesCopy = List<OfferedCourse>.from(selectedCourses);

    if (selectedCoursesCopy.isEmpty) {
      state = state.copyWith(offeredCoursesSchedules: [
        const OfferedCoursesSchedule(
          offeredCourses: [],
          scheduleDays: {
            Day.sun: [],
            Day.mon: [],
            Day.tue: [],
            Day.wed: [],
            Day.thu: [],
          },
          hasConflicts: false,
          conflicts: [],
        ),
      ]);
      return;
    }

    final schedules = _generateSchedulesForCourses(selectedCoursesCopy);

    state = state.copyWith(
      offeredCoursesSchedules: schedules,
    );
  }

  List<OfferedCoursesSchedule> _generateSchedulesForCourses(
    List<OfferedCourse> courses, [
    List<OfferedCourse> includedCourses = const [],
  ]) {
    if (courses.isEmpty) {
      return [
        OfferedCoursesSchedule(
          offeredCourses: includedCourses,
          scheduleDays: {
            Day.sun: [],
            Day.mon: [],
            Day.tue: [],
            Day.wed: [],
            Day.thu: [],
          },
          hasConflicts: false,
          conflicts: [],
        ),
      ];
    }

    final course = courses.removeLast();
    final smallerSchedules = _generateSchedulesForCourses(
        courses, includedCourses); // pass down the already included courses
    final result = <OfferedCoursesSchedule>[];

    for (final timeTable in course.timeTable) {
      for (final smallerSchedule in smallerSchedules) {
        List<Conflict> conflicts = [];
        final hasConflicts = !_isFree(
          smallerSchedule.scheduleDays,
          timeTable,
          course,
          conflicts,
        );
        final newSchedule = _copySchedule(smallerSchedule.scheduleDays);
        final newIncludedCourses = List<OfferedCourse>.from(
          includedCourses,
        );
        if (!hasConflicts) {
          newIncludedCourses.add(course);
          for (final day in timeTable.days) {
            final scheduleEntry = ScheduleEntry(
              startTime: timeTable.startTime,
              endTime: timeTable.endTime,
              room: timeTable.room,
              activityDesc: course.activityDesc,
              courseName: course.courseName,
              courseCode: course.courseCode,
              instructor: course.teacherName,
              creditHours: course.creditHours.toString(),
              campusName: course.campusName,
              courseDeleted: false,
              section: course.sectionSeq,
            );
            newSchedule[day]!.add(scheduleEntry);
          }
        }
        result.add(OfferedCoursesSchedule(
          offeredCourses: newIncludedCourses,
          scheduleDays: newSchedule,
          hasConflicts: hasConflicts,
          conflicts: conflicts,
        ));
      }
    }

    return result;
  }

  bool _isFree(Map<Day, List<ScheduleEntry>> scheduleDays, TimeTable timeTable,
      OfferedCourse currentCourse, List<Conflict> conflicts) {
    for (final day in timeTable.days) {
      for (final entry in scheduleDays[day]!) {
        if (entry.startTime.compareTo(timeTable.endTime) < 0 &&
            entry.endTime.compareTo(timeTable.startTime) > 0) {
          conflicts.add(Conflict(
            firstEntry: ScheduleEntry(
              startTime: timeTable.startTime,
              endTime: timeTable.endTime,
              room: timeTable.room,
              activityDesc: currentCourse.activityDesc,
              courseName: currentCourse.courseName,
              courseCode: currentCourse.courseCode,
              instructor: currentCourse.teacherName,
              creditHours: currentCourse.creditHours.toString(),
              campusName: currentCourse.campusName,
              courseDeleted: false,
              section: currentCourse.sectionSeq,
            ),
            secondEntry: entry,
          ));
          return false;
        }
      }
    }
    return true;
  }

  Map<Day, List<ScheduleEntry>> _copySchedule(
    Map<Day, List<ScheduleEntry>> original,
  ) {
    final copy = <Day, List<ScheduleEntry>>{};
    for (final day in original.keys) {
      copy[day] = List<ScheduleEntry>.from(original[day]!);
    }
    return copy;
  }

  void removeCourseAndRegenerate(
    List<OfferedCourse> offeredCourses,
    String courseCode,
  ) {
    final offeredCoursesCopy = List<OfferedCourse>.from(offeredCourses);
    offeredCoursesCopy.removeWhere(
      (offeredCourse) => offeredCourse.courseCode == courseCode,
    );

    generateSuggestedSchedules(selectedCourses: offeredCoursesCopy);
  }

  Future<void> submitSchedule() async {
    try {
      state = state.copyWith(
        status: ScheduleBuilderViewStatus.submitting,
      );

      final response = await _apiService.doRegistration(
        courses: state.offeredCoursesSchedules[state.selectedScheduleIndex]
            .offeredCourses,
      );

      switch (response.itemValue) {
        case '1':
          state = state.copyWith(
            status: ScheduleBuilderViewStatus.submitted,
          );
          break;
        case '2':
          state = state.copyWith(
            status: ScheduleBuilderViewStatus.paymentRequired,
            paymentRequiredMessage: response.itemDesc,
          );
          break;
        default:
          state = state.copyWith(
            status: ScheduleBuilderViewStatus.errorSubmitting,
          );
          break;
      }
    } on ApiServiceException catch (e) {
      _log.severe('error submitting schedule: $e');

      state = state.copyWith(
        status: ScheduleBuilderViewStatus.errorSubmitting,
      );

      await Future.delayed(const Duration(seconds: 3));

      state = state.copyWith(
        status: ScheduleBuilderViewStatus.unknown,
      );
    }
  }
}
