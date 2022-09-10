// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alyamamah/app/model/timetable_entry.dart';
import 'package:collection/collection.dart';

class StudentScheduleCourse {
  final String activityDesc;
  final String campusName;
  final String courseCode;
  final String courseName;
  final String sectionSeq;
  final String crdHrs;
  final List<TimetableEntry> timeTable;
  final String instructor;

  StudentScheduleCourse({
    required this.activityDesc,
    required this.campusName,
    required this.courseCode,
    required this.courseName,
    required this.sectionSeq,
    required this.crdHrs,
    required this.timeTable,
    required this.instructor,
  });

  StudentScheduleCourse copyWith({
    String? activityDesc,
    String? campusName,
    String? courseCode,
    String? courseName,
    String? sectionSeq,
    String? crdHrs,
    List<TimetableEntry>? timeTable,
    String? instructor,
  }) {
    return StudentScheduleCourse(
      activityDesc: activityDesc ?? this.activityDesc,
      campusName: campusName ?? this.campusName,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      sectionSeq: sectionSeq ?? this.sectionSeq,
      crdHrs: crdHrs ?? this.crdHrs,
      timeTable: timeTable ?? this.timeTable,
      instructor: instructor ?? this.instructor,
    );
  }

  factory StudentScheduleCourse.fromMap(Map<String, dynamic> map) {
    return StudentScheduleCourse(
      activityDesc: map['activityDesc'] as String,
      campusName: map['campusName'] as String,
      courseCode: map['courseCode'] as String,
      courseName: map['courseName'] as String,
      sectionSeq: map['sectionSeq'] as String,
      crdHrs: map['crdHrs'] as String,
      timeTable: List<TimetableEntry>.from(
        (map['timeTable'] as List).map<TimetableEntry>(
          (x) => TimetableEntry.fromMap(x as Map<String, dynamic>),
        ),
      ),
      instructor: map['instructor'] as String,
    );
  }

  factory StudentScheduleCourse.fromJson(String source) =>
      StudentScheduleCourse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentScheduleCourse(activityDesc: $activityDesc, campusName: $campusName, courseCode: $courseCode, courseName: $courseName, sectionSeq: $sectionSeq, crdHrs: $crdHrs, timeTable: $timeTable, instructor: $instructor)';
  }

  @override
  bool operator ==(covariant StudentScheduleCourse other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.activityDesc == activityDesc &&
        other.campusName == campusName &&
        other.courseCode == courseCode &&
        other.courseName == courseName &&
        other.sectionSeq == sectionSeq &&
        other.crdHrs == crdHrs &&
        listEquals(other.timeTable, timeTable) &&
        other.instructor == instructor;
  }

  @override
  int get hashCode {
    return activityDesc.hashCode ^
        campusName.hashCode ^
        courseCode.hashCode ^
        courseName.hashCode ^
        sectionSeq.hashCode ^
        crdHrs.hashCode ^
        timeTable.hashCode ^
        instructor.hashCode;
  }
}
