import 'package:alyamamah/ui/views/schedule_builder/models/offered_courses_schedule.dart';
import 'package:flutter/foundation.dart';

enum ScheduleBuilderViewStatus {
  unknown,
  submitting,
  submitted,
  errorSubmitting,
  paymentRequired,
}

class ScheduleBuilderViewState {
  final ScheduleBuilderViewStatus status;
  final List<OfferedCoursesSchedule> offeredCoursesSchedules;
  final int selectedScheduleIndex;
  final String paymentRequiredMessage;

  ScheduleBuilderViewState({
    this.status = ScheduleBuilderViewStatus.unknown,
    this.offeredCoursesSchedules = const [],
    this.selectedScheduleIndex = 0,
    this.paymentRequiredMessage = '',
  });

  ScheduleBuilderViewState copyWith({
    ScheduleBuilderViewStatus? status,
    List<OfferedCoursesSchedule>? offeredCoursesSchedules,
    int? selectedScheduleIndex,
    String? paymentRequiredMessage,
  }) {
    return ScheduleBuilderViewState(
      status: status ?? this.status,
      offeredCoursesSchedules:
          offeredCoursesSchedules ?? this.offeredCoursesSchedules,
      selectedScheduleIndex:
          selectedScheduleIndex ?? this.selectedScheduleIndex,
      paymentRequiredMessage:
          paymentRequiredMessage ?? this.paymentRequiredMessage,
    );
  }

  @override
  bool operator ==(covariant ScheduleBuilderViewState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.offeredCoursesSchedules, offeredCoursesSchedules) &&
        other.selectedScheduleIndex == selectedScheduleIndex &&
        other.paymentRequiredMessage == paymentRequiredMessage;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        offeredCoursesSchedules.hashCode ^
        selectedScheduleIndex.hashCode ^
        paymentRequiredMessage.hashCode;
  }
}
