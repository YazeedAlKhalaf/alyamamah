import 'package:flutter/material.dart';

class ScheduleEntry {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String room;
  final String activityDesc;
  final String courseName;
  final String courseCode;
  final String instructor;
  final String creditHours;
  final String campusName;
  final bool courseDeleted;
  final String section;

  ScheduleEntry({
    required this.startTime,
    required this.endTime,
    required this.room,
    required this.activityDesc,
    required this.courseName,
    required this.courseCode,
    required this.instructor,
    required this.creditHours,
    required this.campusName,
    required this.courseDeleted,
    required this.section,
  });

  ScheduleEntry copyWith({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? room,
    String? activityDesc,
    String? courseName,
    String? courseCode,
    String? instructor,
    String? creditHours,
    String? campusName,
    bool? courseDeleted,
    String? section,
  }) {
    return ScheduleEntry(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      room: room ?? this.room,
      activityDesc: activityDesc ?? this.activityDesc,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
      instructor: instructor ?? this.instructor,
      creditHours: creditHours ?? this.creditHours,
      campusName: campusName ?? this.campusName,
      courseDeleted: courseDeleted ?? this.courseDeleted,
      section: section ?? this.section,
    );
  }

  @override
  bool operator ==(covariant ScheduleEntry other) {
    if (identical(this, other)) return true;

    return other.startTime == startTime &&
        other.endTime == endTime &&
        other.room == room &&
        other.activityDesc == activityDesc &&
        other.courseName == courseName &&
        other.courseCode == courseCode &&
        other.instructor == instructor &&
        other.creditHours == creditHours &&
        other.campusName == campusName &&
        other.courseDeleted == courseDeleted &&
        other.section == section;
  }

  @override
  int get hashCode {
    return startTime.hashCode ^
        endTime.hashCode ^
        room.hashCode ^
        activityDesc.hashCode ^
        courseName.hashCode ^
        courseCode.hashCode ^
        instructor.hashCode ^
        creditHours.hashCode ^
        campusName.hashCode ^
        courseDeleted.hashCode ^
        section.hashCode;
  }
}
