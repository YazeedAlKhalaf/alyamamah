import 'package:alyamamah/core/models/course_result.dart';
import 'package:flutter/foundation.dart';

enum GradesViewStatus {
  unknown,
  loading,
  loaded,
  errorLoading,
}

class GradesViewState {
  final GradesViewStatus status;
  final List<CourseResult> coursesResults;
  final String selectedSemester;
  final Map<String, List<CourseResult>> coursesResultsBySemester;

  GradesViewState({
    this.status = GradesViewStatus.unknown,
    this.coursesResults = const [],
    this.coursesResultsBySemester = const {},
    required this.selectedSemester,
  });

  GradesViewState copyWith({
    GradesViewStatus? status,
    List<CourseResult>? coursesResults,
    Map<String, List<CourseResult>>? coursesResultsBySemester,
    String? selectedSemester,
  }) {
    return GradesViewState(
      status: status ?? this.status,
      coursesResults: coursesResults ?? this.coursesResults,
      coursesResultsBySemester:
          coursesResultsBySemester ?? this.coursesResultsBySemester,
      selectedSemester: selectedSemester ?? this.selectedSemester,
    );
  }

  @override
  bool operator ==(covariant GradesViewState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.coursesResults, coursesResults) &&
        other.selectedSemester == selectedSemester &&
        mapEquals(other.coursesResultsBySemester, coursesResultsBySemester);
  }

  @override
  int get hashCode {
    return status.hashCode ^
        coursesResults.hashCode ^
        selectedSemester.hashCode ^
        coursesResultsBySemester.hashCode;
  }
}
