import 'package:alyamamah/core/models/offered_course.dart';
import 'package:alyamamah/core/models/optional.dart';
import 'package:alyamamah/core/models/registration_hours.dart';
import 'package:flutter/foundation.dart';

enum OfferedCoursesViewStatus {
  unknown,
  loading,
  loaded,
  errorLoading,
}

class OfferedCoursesViewState {
  final OfferedCoursesViewStatus status;
  final List<OfferedCourse> offeredCourses;
  final List<String> selectedCourseCodes;
  final RegistrationHours? registrationHours;

  double get selectedHours => selectedCourseCodes.fold(
        0,
        (previousValue, courseCode) =>
            previousValue +
            offeredCourses
                .singleWhere(
                    (offeredCourse) => offeredCourse.courseCode == courseCode)
                .creditHours,
      );

  List<OfferedCourse> get selectedOfferedCourses => offeredCourses
      .where(
        (offeredCourse) => selectedCourseCodes.contains(
          offeredCourse.courseCode,
        ),
      )
      .toList();

  OfferedCoursesViewState({
    this.status = OfferedCoursesViewStatus.unknown,
    this.offeredCourses = const [],
    this.selectedCourseCodes = const [],
    this.registrationHours,
  });

  OfferedCoursesViewState copyWith({
    OfferedCoursesViewStatus? status,
    List<OfferedCourse>? offeredCourses,
    List<String>? selectedCourseCodes,
    Optional<RegistrationHours?>? registrationHours,
  }) {
    return OfferedCoursesViewState(
      status: status ?? this.status,
      offeredCourses: offeredCourses ?? this.offeredCourses,
      selectedCourseCodes: selectedCourseCodes ?? this.selectedCourseCodes,
      registrationHours: registrationHours == null
          ? this.registrationHours
          : registrationHours.value,
    );
  }

  @override
  bool operator ==(covariant OfferedCoursesViewState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.offeredCourses, offeredCourses) &&
        listEquals(other.selectedCourseCodes, selectedCourseCodes) &&
        other.registrationHours == registrationHours;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        offeredCourses.hashCode ^
        selectedCourseCodes.hashCode ^
        registrationHours.hashCode;
  }
}
