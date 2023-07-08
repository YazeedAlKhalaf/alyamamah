import 'dart:convert';

import 'package:alyamamah/core/extensions/string.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeTable {
  final Set<Day> days;
  final String room;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const TimeTable({
    required this.days,
    required this.room,
    required this.startTime,
    required this.endTime,
  });

  TimeTable copyWith({
    Set<Day>? days,
    String? room,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return TimeTable(
      days: days ?? this.days,
      room: room ?? this.room,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  factory TimeTable.fromMap(Map<String, dynamic> map) {
    final daysParts = (map['day'] as String).trim().split(' ');
    final days = <Day>{};
    for (String dayPart in daysParts) {
      switch (dayPart) {
        case 'U':
        case '1':
          days.add(Day.sun);
          break;
        case 'M':
        case '2':
          days.add(Day.mon);
          break;
        case 'T':
        case '3':
          days.add(Day.tue);
          break;
        case 'W':
        case '4':
          days.add(Day.wed);
          break;
        case 'TH':
        case '5':
          days.add(Day.thu);
          break;
      }
    }

    final timeParts = (map['time'] as String).split('-');
    final startTimeUnparsed = timeParts[0].trim();
    final endTimeUnparsed = timeParts[1].trim();

    return TimeTable(
      days: days,
      room: (map['room'] as String).trim(),
      startTime: startTimeUnparsed.mapToTimeOfDay(),
      endTime: endTimeUnparsed.mapToTimeOfDay(),
    );
  }

  factory TimeTable.fromJson(String source) =>
      TimeTable.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    final day = days.map((e) {
      switch (e) {
        case Day.sun:
          return 'U';
        case Day.mon:
          return 'M';
        case Day.tue:
          return 'T';
        case Day.wed:
          return 'W';
        case Day.thu:
          return 'TH';
        case Day.fri:
        case Day.sat:
          return '';
      }
    }).join(' ');

    return <String, dynamic>{
      'day': ' $day ',
      'room': ' $room',
      'time':
          ' ${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')} ${startTime.period.name} - ${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')} ${endTime.period.name} '
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'TimeTable(days: $days, room: $room, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(covariant TimeTable other) {
    if (identical(this, other)) return true;

    return setEquals(other.days, days) &&
        other.room == room &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return days.hashCode ^
        room.hashCode ^
        startTime.hashCode ^
        endTime.hashCode;
  }
}
