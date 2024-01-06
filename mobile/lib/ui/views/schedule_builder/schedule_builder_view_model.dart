import 'dart:math' as math;

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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  ScheduleBuilderViewModel({required ApiService apiService})
      : _apiService = apiService,
        super(ScheduleBuilderViewState());

  void setSelectedScheduleIndex(int index) {
    state = state.copyWith(selectedScheduleIndex: index);
  }

  void generateSuggestedSchedules({
    required List<OfferedCourse> selectedCourses,
  }) async {
    if (selectedCourses.isEmpty) {
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

    state = state.copyWith(status: ScheduleBuilderViewStatus.generating);

    final comprehensiveCourses = <OfferedCourse>[];
    for (var course in selectedCourses) {
      final relatedCourses = await _apiService.getRelatedCourses(
        offeredCourse: course,
      );
      final newCourse = course.copyWith(
        activityCourses: relatedCourses,
      );
      comprehensiveCourses.add(newCourse);
    }

    // Run the heavy computation in the background, isolate :)
    final schedules = await compute(
      _generateSchedulesForCourses,
      comprehensiveCourses,
    );

    state = state.copyWith(
      status: ScheduleBuilderViewStatus.generated,
      offeredCoursesSchedules: schedules,
    );
  }

  static List<OfferedCoursesSchedule> _generateSchedulesForCourses(
    List<OfferedCourse> courses,
  ) {
    final result = <OfferedCoursesSchedule>[];
    final combinations = _getAllCombinations(courses);

    for (final combination in combinations) {
      final expandedCombination = combination.expand((course) {
        final relatedActivities = course.activityCourses;
        return [course, ...relatedActivities];
      }).toList();

      List<Conflict> conflicts = [];
      final scheduleDays = <Day, List<ScheduleEntry>>{
        Day.sun: [],
        Day.mon: [],
        Day.tue: [],
        Day.wed: [],
        Day.thu: [],
      };
      bool hasConflicts = false;

      for (final course in expandedCombination) {
        for (final timeTable in course.timeTable) {
          if (!_isFree(scheduleDays, timeTable, course, conflicts)) {
            hasConflicts = true;
            break;
          }
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
            scheduleDays[day]!.add(scheduleEntry);
          }
        }
      }

      result.add(OfferedCoursesSchedule(
        offeredCourses: expandedCombination,
        scheduleDays: scheduleDays,
        hasConflicts: hasConflicts,
        conflicts: conflicts,
      ));
    }

    // TODO: make this sorting configurable, now only from least to most breaks
    result.sort((a, b) {
      // Priority 1: Conflicts
      if (a.hasConflicts && !b.hasConflicts) return 1;
      if (!a.hasConflicts && b.hasConflicts) return -1;

      // Priority 2: Block Length
      int maxBlockLengthA = _findMaxContinuousBlockLength(a.scheduleDays);
      int maxBlockLengthB = _findMaxContinuousBlockLength(b.scheduleDays);
      if (maxBlockLengthA != maxBlockLengthB) {
        // Note: We're sorting in descending order here.
        return maxBlockLengthB.compareTo(maxBlockLengthA);
      }

      // Priority 3: Starting time
      final startTimeA = _findEarliestStartTime(a.scheduleDays);
      final startTimeB = _findEarliestStartTime(b.scheduleDays);
      if (startTimeA.compareTo(startTimeB) != 0) {
        return startTimeA.compareTo(startTimeB);
      }

      // Priority 4: Total scatter
      return _calculateScatter(a.scheduleDays)
          .compareTo(_calculateScatter(b.scheduleDays));
    });

    return result;
  }

  static bool _isFree(
    Map<Day, List<ScheduleEntry>> scheduleDays,
    TimeTable timeTable,
    OfferedCourse currentCourse,
    List<Conflict> conflicts,
  ) {
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

  static List<List<OfferedCourse>> _getAllCombinations(
    List<OfferedCourse> courses,
  ) {
    Set<String> distinctCourses = courses.map((c) => c.courseCode).toSet();
    if (distinctCourses.length == courses.length) {
      return [courses];
    }

    List<List<OfferedCourse>> combinations = [];
    _generateCombinations(courses, distinctCourses.toList(), [], combinations);
    return combinations;
  }

  static void _generateCombinations(
    List<OfferedCourse> courses,
    List<String> distinctCourses,
    List<OfferedCourse> current,
    List<List<OfferedCourse>> result,
  ) {
    if (current.length == distinctCourses.length) {
      result.add(List.from(current));
      return;
    }

    String nextCourseCode = distinctCourses[current.length];
    for (OfferedCourse course in courses) {
      if (course.courseCode == nextCourseCode && !current.contains(course)) {
        current.add(course);
        _generateCombinations(courses, distinctCourses, current, result);
        current.removeLast();
      }
    }
  }

  static int _findMaxContinuousBlockLength(
    Map<Day, List<ScheduleEntry>> scheduleDays,
  ) {
    int maxLength = 0;
    for (final entries in scheduleDays.values) {
      int currentLength = 0;
      for (int i = 0; i < entries.length - 1; i++) {
        if (entries[i + 1].startTime.difference(entries[i].endTime).inMinutes ==
            0) {
          currentLength++;
        } else {
          maxLength = math.max(
            maxLength,
            currentLength + 1,
          ); // Including the current entry in block length
          currentLength = 0; // Reset for next block
        }
      }
      maxLength = math.max(
        maxLength,
        currentLength + (entries.isNotEmpty ? 1 : 0),
      ); // Handle last/only block
    }
    return maxLength;
  }

  static int _calculateScatter(Map<Day, List<ScheduleEntry>> scheduleDays) {
    int scatter = 0;
    for (final entries in scheduleDays.values) {
      for (int i = 0; i < entries.length - 1; i++) {
        final gap =
            entries[i + 1].startTime.difference(entries[i].endTime).inMinutes;
        if (gap > 0) {
          scatter += gap;
        }
      }
    }
    return scatter;
  }

  static TimeOfDay _findEarliestStartTime(
    Map<Day, List<ScheduleEntry>> schedule,
  ) {
    TimeOfDay earliest = const TimeOfDay(hour: 23, minute: 59);

    for (var dailyEntries in schedule.values) {
      if (dailyEntries.isEmpty) continue;

      // Sort entries by start time for each day and compare the first (earliest) one
      dailyEntries.sort((a, b) => a.startTime.compareTo(b.startTime));
      if (dailyEntries[0].startTime.compareTo(earliest) < 0) {
        earliest = dailyEntries[0].startTime;
      }
    }

    return earliest;
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

  void removeCourseFromSelectedSchedule(
    String courseCodeToRemove,
  ) {
    final currentSchedule =
        state.offeredCoursesSchedules[state.selectedScheduleIndex];

    final modifiedCourses = currentSchedule.offeredCourses
        .where((course) => course.courseCode != courseCodeToRemove)
        .toList();

    final modifiedSchedule =
        _generateSchedulesForCourses(modifiedCourses).first;

    final updatedSchedules =
        List<OfferedCoursesSchedule>.from(state.offeredCoursesSchedules);
    updatedSchedules[state.selectedScheduleIndex] = modifiedSchedule;

    state = state.copyWith(offeredCoursesSchedules: updatedSchedules);
  }

  Future<void> submitSchedule() async {
    try {
      state = state.copyWith(status: ScheduleBuilderViewStatus.submitting);

      final mainCourses = state
          .offeredCoursesSchedules[state.selectedScheduleIndex].offeredCourses
          // '2' represents lecture
          // '7' represents lab
          .where((element) => element.activityCode == '2')
          .toList();

      final response = await _apiService.doRegistration(
        courses: mainCourses,
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
          _log.severe('unexpected response submitting the schedule: $response');
          state = state.copyWith(
            status: ScheduleBuilderViewStatus.errorSubmitting,
          );
          break;
      }
    } on ApiServiceException catch (e) {
      _log.severe('error submitting the schedule: $e');
      state = state.copyWith(
        status: ScheduleBuilderViewStatus.errorSubmitting,
      );
    }
  }
}
