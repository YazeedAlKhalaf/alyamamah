import 'package:flutter/material.dart';

class ScheduleEntry {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String room;
  final String activityDesc;
  final String courseName;
  final String courseCode;

  ScheduleEntry({
    required this.startTime,
    required this.endTime,
    required this.room,
    required this.activityDesc,
    required this.courseName,
    required this.courseCode,
  });

  ScheduleEntry copyWith({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? room,
    String? activityDesc,
    String? courseName,
    String? courseCode,
  }) {
    return ScheduleEntry(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      room: room ?? this.room,
      activityDesc: activityDesc ?? this.activityDesc,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
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
        other.courseCode == courseCode;
  }

  @override
  int get hashCode {
    return startTime.hashCode ^
        endTime.hashCode ^
        room.hashCode ^
        activityDesc.hashCode ^
        courseName.hashCode ^
        courseCode.hashCode;
  }
}
