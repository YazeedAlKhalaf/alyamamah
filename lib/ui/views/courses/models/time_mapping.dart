import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/courses/models/academic_mapping.dart';
import 'package:alyamamah/ui/views/courses/models/interlink_mapping.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeMapping {
  final TimeOfDay originalStartTime;
  final TimeOfDay originalEndTime;
  final TimeOfDay newStartTime;
  final TimeOfDay newEndTime;
  final Set<Day> days;
  final Set<Day> newDays;
  final Set<int> sections;

  TimeMapping({
    required this.originalStartTime,
    required this.originalEndTime,
    required this.newStartTime,
    required this.newEndTime,
    required this.days,
    required this.newDays,
    required this.sections,
  });

  factory TimeMapping.fromMap(Map<String, dynamic> map) {
    return TimeMapping(
      originalStartTime: TimeOfDay(
        hour: map['regular_time']['start_time']['hour'],
        minute: map['regular_time']['start_time']['minute'],
      ),
      originalEndTime: TimeOfDay(
        hour: map['regular_time']['end_time']['hour'],
        minute: map['regular_time']['end_time']['minute'],
      ),
      newStartTime: TimeOfDay(
        hour: map['ramadan_time']['start_time']['hour'],
        minute: map['ramadan_time']['start_time']['minute'],
      ),
      newEndTime: TimeOfDay(
        hour: map['ramadan_time']['end_time']['hour'],
        minute: map['ramadan_time']['end_time']['minute'],
      ),
      days: Set<Day>.from(
        (map['regular_time']['days'] as List<dynamic>).map<Day>(
          (x) => Day.values[x - 1],
        ),
      ),
      newDays: Set<Day>.from(
        (map['ramadan_time']['days'] as List<dynamic>).map<Day>(
          (x) => Day.values[x - 1],
        ),
      ),
      sections: Set<int>.from((map['sections'] as List<dynamic>)),
    );
  }
}

class TimeConversionResponse {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Set<Day> days;

  TimeConversionResponse({
    required this.startTime,
    required this.endTime,
    required this.days,
  });
}

TimeConversionResponse convertToRamdanTime(
  Set<Day> days,
  TimeOfDay startTime,
  TimeOfDay endTime,
  int section,
) {
  final mappingCombined = [
    ...academicMappingParsed,
    ...interlinkMappingParsed,
  ];

  final timeMapping = mappingCombined.firstWhere(
    (TimeMapping mapping) {
      return mapping.sections.contains(section) &&
          setEquals(mapping.days, days) &&
          mapping.originalStartTime == startTime &&
          mapping.originalEndTime == endTime;
    },
    orElse: () => TimeMapping(
      originalStartTime: startTime,
      originalEndTime: endTime,
      newStartTime: startTime,
      newEndTime: endTime,
      days: {},
      newDays: {},
      sections: {section},
    ),
  );

  return TimeConversionResponse(
    startTime: timeMapping.newStartTime,
    endTime: timeMapping.newEndTime,
    days: timeMapping.newDays,
  );
}
