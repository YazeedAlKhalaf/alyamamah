import 'dart:convert';

import 'package:flutter/material.dart';

class IosWidgetCourse {
  final Color color;
  final String courseCode;
  final String roomName;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  IosWidgetCourse({
    required this.color,
    required this.courseCode,
    required this.roomName,
    required this.startTime,
    required this.endTime,
  });

  IosWidgetCourse copyWith({
    Color? color,
    String? courseCode,
    String? roomName,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return IosWidgetCourse(
      color: color ?? this.color,
      courseCode: courseCode ?? this.courseCode,
      roomName: roomName ?? this.roomName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': '#${color.value.toRadixString(16)}',
      'courseCode': courseCode,
      'roomName': roomName,
      'startTime':
          '${startTime.hour}:${startTime.minute} ${startTime.period.name}',
      'endTime': '${endTime.hour}:${endTime.minute} ${endTime.period.name}',
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'IosWidgetCourse(color: #${color.value.toRadixString(16)}, courseCode: $courseCode, roomName: $roomName, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(covariant IosWidgetCourse other) {
    if (identical(this, other)) return true;

    return other.color == color &&
        other.courseCode == courseCode &&
        other.roomName == roomName &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        courseCode.hashCode ^
        roomName.hashCode ^
        startTime.hashCode ^
        endTime.hashCode;
  }
}
