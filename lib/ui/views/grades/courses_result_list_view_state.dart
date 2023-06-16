import 'package:alyamamah/core/models/course_result.dart';
import 'package:alyamamah/core/models/student_gpa.dart';
import 'package:flutter/foundation.dart';

enum CoursesResultListViewStatus {
  unknown,
  loading,
  loaded,
  errorLoading,
}

class CoursesResultListViewState {
  final CoursesResultListViewStatus status;
  final List<CourseResult> coursesResults;
  final StudentGPA? studentGPA;

  CoursesResultListViewState({
    this.status = CoursesResultListViewStatus.unknown,
    this.coursesResults = const [],
    this.studentGPA,
  });

  CoursesResultListViewState copyWith({
    CoursesResultListViewStatus? status,
    List<CourseResult>? coursesResults,
    String? selectedSemester,
    StudentGPA? studentGPA,
  }) {
    return CoursesResultListViewState(
      status: status ?? this.status,
      coursesResults: coursesResults ?? this.coursesResults,
      studentGPA: studentGPA ?? this.studentGPA,
    );
  }

  @override
  bool operator ==(covariant CoursesResultListViewState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.coursesResults, coursesResults) &&
        other.studentGPA == studentGPA;
  }

  @override
  int get hashCode =>
      status.hashCode ^ coursesResults.hashCode ^ studentGPA.hashCode;
}
