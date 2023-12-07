import 'package:flutter/material.dart';

class FinalExam {
  final String courseCode;
  final String courseName;
  final String courseSection;
  final String examRoom;
  final String examDay;
  final TimeOfDay examTime;
  final DateTime examDate;

  FinalExam({
    required this.courseCode,
    required this.courseName,
    required this.courseSection,
    required this.examRoom,
    required this.examDay,
    required this.examTime,
    required this.examDate,
  });

  Duration get timeUntilExam => examDate.difference(DateTime.now());

  bool get isToday => DateTime.now().difference(examDate).inDays == 0;

  FinalExam copyWith({
    String? courseCode,
    String? courseName,
    String? courseSection,
    String? examRoom,
    String? examDay,
    TimeOfDay? examTime,
    DateTime? examDate,
  }) {
    return FinalExam(
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      courseSection: courseSection ?? this.courseSection,
      examRoom: examRoom ?? this.examRoom,
      examDay: examDay ?? this.examDay,
      examTime: examTime ?? this.examTime,
      examDate: examDate ?? this.examDate,
    );
  }

  @override
  String toString() {
    return 'FinalExam(courseCode: $courseCode, courseName: $courseName, courseSection: $courseSection, examRoom: $examRoom, examDay: $examDay, examTime: $examTime, examDate: $examDate)';
  }

  @override
  bool operator ==(covariant FinalExam other) {
    if (identical(this, other)) return true;

    return other.courseCode == courseCode &&
        other.courseName == courseName &&
        other.courseSection == courseSection &&
        other.examRoom == examRoom &&
        other.examDay == examDay &&
        other.examTime == examTime &&
        other.examDate == examDate;
  }

  @override
  int get hashCode {
    return courseCode.hashCode ^
        courseName.hashCode ^
        courseSection.hashCode ^
        examRoom.hashCode ^
        examDay.hashCode ^
        examTime.hashCode ^
        examDate.hashCode;
  }
}
