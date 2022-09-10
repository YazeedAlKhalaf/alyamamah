// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

enum Day {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
}

extension DayFromWeekday on DateTime {
  Day get dayFromWeekday {
    switch (weekday) {
      case 1: // monday
        return Day.monday;
      case 2: // tuesday
        return Day.tuesday;
      case 3: // wednesday
        return Day.wednesday;
      case 4: // thursday
        return Day.thursday;
      case 7: // sunday
      case 5: // friday
      case 6: // saturday
      default:
        return Day.sunday;
    }
  }
}

class TimetableEntry {
  final List<Day> days;
  final String room;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  TimetableEntry({
    required this.days,
    required this.room,
    required this.startTime,
    required this.endTime,
  });

  TimetableEntry copyWith({
    List<Day>? days,
    String? room,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return TimetableEntry(
      days: days ?? this.days,
      room: room ?? this.room,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  factory TimetableEntry.fromMap(Map<String, dynamic> map) {
    final dayRaw = (map['day'] as String).trim();
    final daysRaw = dayRaw.split(' ');
    final days = <Day>[];
    for (String dayFromDaysRaw in daysRaw) {
      switch (dayFromDaysRaw) {
        case 'U':
          days.add(Day.sunday);
          break;
        case 'M':
          days.add(Day.monday);
          break;
        case 'T':
          days.add(Day.tuesday);
          break;
        case 'W':
          days.add(Day.wednesday);
          break;
        case 'TH':
          days.add(Day.thursday);
          break;
      }
    }

    final time = map['time'] as String;
    final timeParts = time.split('-');

    final startTimeRaw = timeParts[0].trim();
    final isStartTimeRawPM = startTimeRaw.contains('PM');
    final startTimeRawWithoutAMPM =
        startTimeRaw.replaceAll('AM', '').replaceAll('PM', '').trim();
    final startTimeRawParts = startTimeRawWithoutAMPM.split(':');
    final startTime = TimeOfDay(
      hour: int.parse(startTimeRawParts[0]) + (isStartTimeRawPM ? 12 : 0),
      minute: int.parse(startTimeRawParts[1]),
    );

    final endTimeRaw = timeParts[1].trim();
    final isEndTimeRawPM = endTimeRaw.contains('PM');
    final endTimeRawWithoutAMPM =
        endTimeRaw.replaceAll('AM', '').replaceAll('PM', '').trim();
    final endTimeRawParts = endTimeRawWithoutAMPM.split(':');
    final endTime = TimeOfDay(
      hour: int.parse(endTimeRawParts[0]) + (isEndTimeRawPM ? 12 : 0),
      minute: int.parse(endTimeRawParts[1]),
    );

    return TimetableEntry(
      days: days,
      room: map['room'] as String,
      startTime: startTime,
      endTime: endTime,
    );
  }
  @override
  String toString() {
    return 'TimetableEntry(days: $days, room: $room, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(covariant TimetableEntry other) {
    if (identical(this, other)) return true;

    return other.days == days &&
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
