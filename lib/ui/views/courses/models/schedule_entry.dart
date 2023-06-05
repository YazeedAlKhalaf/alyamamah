import 'dart:convert';

import 'package:alyamamah/core/extensions/time_of_day.dart';
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

  @override
  String toString() {
    return 'ScheduleEntry(startTime: $startTime, endTime: $endTime, room: $room, activityDesc: $activityDesc, courseName: $courseName, courseCode: $courseCode, instructor: $instructor, creditHours: $creditHours, campusName: $campusName, courseDeleted: $courseDeleted, section: $section)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      'room': room,
      'activityDesc': activityDesc,
      'courseName': courseName,
      'courseCode': courseCode,
      'instructor': instructor,
      'creditHours': creditHours,
      'campusName': campusName,
      'courseDeleted': courseDeleted,
      'section': section,
    };
  }

  factory ScheduleEntry.fromMap(Map<String, dynamic> map) {
    return ScheduleEntry(
      startTime: timeOfDayFromJson(map['startTime'] as String),
      endTime: timeOfDayFromJson(map['endTime'] as String),
      room: map['room'] as String,
      activityDesc: map['activityDesc'] as String,
      courseName: map['courseName'] as String,
      courseCode: map['courseCode'] as String,
      instructor: map['instructor'] as String,
      creditHours: map['creditHours'] as String,
      campusName: map['campusName'] as String,
      courseDeleted: map['courseDeleted'] as bool,
      section: map['section'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleEntry.fromJson(String source) =>
      ScheduleEntry.fromMap(json.decode(source) as Map<String, dynamic>);
}
