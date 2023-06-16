import 'package:alyamamah/core/models/course_result.dart';
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

  CoursesResultListViewState({
    this.status = CoursesResultListViewStatus.unknown,
    this.coursesResults = const [],
  });

  CoursesResultListViewState copyWith({
    CoursesResultListViewStatus? status,
    List<CourseResult>? coursesResults,
    String? selectedSemester,
  }) {
    return CoursesResultListViewState(
      status: status ?? this.status,
      coursesResults: coursesResults ?? this.coursesResults,
    );
  }

  @override
  bool operator ==(covariant CoursesResultListViewState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.coursesResults, coursesResults);
  }

  @override
  int get hashCode {
    return status.hashCode ^ coursesResults.hashCode;
  }
}
