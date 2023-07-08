import 'package:alyamamah/ui/views/schedule_builder/models/offered_courses_schedule.dart';
import 'package:flutter/foundation.dart';

class ScheduleBuilderViewState {
  final List<OfferedCoursesSchedule> offeredCoursesSchedules;

  ScheduleBuilderViewState({
    this.offeredCoursesSchedules = const [],
  });

  ScheduleBuilderViewState copyWith({
    List<OfferedCoursesSchedule>? offeredCoursesSchedules,
  }) {
    return ScheduleBuilderViewState(
      offeredCoursesSchedules:
          offeredCoursesSchedules ?? this.offeredCoursesSchedules,
    );
  }

  @override
  bool operator ==(covariant ScheduleBuilderViewState other) {
    if (identical(this, other)) return true;

    return listEquals(other.offeredCoursesSchedules, offeredCoursesSchedules);
  }

  @override
  int get hashCode => offeredCoursesSchedules.hashCode;
}
