import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/schedule_builder/models/conflict.dart';
import 'package:flutter/foundation.dart';

class OfferedCoursesSchedule {
  final List<OfferedCourse> offeredCourses;
  final Map<Day, List<ScheduleEntry>> scheduleDays;
  final bool hasConflicts;
  final List<Conflict> conflicts;

  const OfferedCoursesSchedule({
    required this.offeredCourses,
    required this.scheduleDays,
    this.hasConflicts = false,
    this.conflicts = const [],
  });

  OfferedCoursesSchedule copyWith({
    List<OfferedCourse>? offeredCourses,
    Map<Day, List<ScheduleEntry>>? scheduleDays,
    bool? hasConflicts,
    List<Conflict>? conflicts,
  }) {
    return OfferedCoursesSchedule(
      offeredCourses: offeredCourses ?? this.offeredCourses,
      scheduleDays: scheduleDays ?? this.scheduleDays,
      hasConflicts: hasConflicts ?? this.hasConflicts,
      conflicts: conflicts ?? this.conflicts,
    );
  }

  @override
  bool operator ==(covariant OfferedCoursesSchedule other) {
    if (identical(this, other)) return true;

    return mapEquals(other.scheduleDays, scheduleDays) &&
        other.hasConflicts == hasConflicts &&
        listEquals(other.conflicts, conflicts);
  }

  @override
  int get hashCode =>
      scheduleDays.hashCode ^ hasConflicts.hashCode ^ conflicts.hashCode;
}
