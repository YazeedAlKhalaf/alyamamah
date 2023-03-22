import 'package:alyamamah/core/models/day.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeMapping {
  final TimeOfDay originalStartTime;
  final TimeOfDay originalEndTime;
  final TimeOfDay newStartTime;
  final TimeOfDay newEndTime;
  final Set<Day> days;
  final Set<Day> newDays;

  TimeMapping({
    required this.originalStartTime,
    required this.originalEndTime,
    required this.newStartTime,
    required this.newEndTime,
    required this.days,
    required this.newDays,
  });
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
) {
  final timeMapping = timeMappings.firstWhere(
    (TimeMapping mapping) =>
        setEquals(mapping.days, days) &&
        mapping.originalStartTime == startTime &&
        mapping.originalEndTime == endTime,
    orElse: () => TimeMapping(
      originalStartTime: startTime,
      originalEndTime: endTime,
      newStartTime: startTime,
      newEndTime: endTime,
      days: {},
      newDays: {},
    ),
  );

  return TimeConversionResponse(
    startTime: timeMapping.newStartTime,
    endTime: timeMapping.newEndTime,
    days: timeMapping.newDays,
  );
}

TimeConversionResponse convertToRegularTime(
  Set<Day> days,
  TimeOfDay startTime,
  TimeOfDay endTime,
) {
  final timeMapping = timeMappings.firstWhere(
    (TimeMapping mapping) =>
        setEquals(mapping.newDays, days) &&
        mapping.newStartTime == startTime &&
        mapping.newEndTime == endTime,
    orElse: () => TimeMapping(
      originalStartTime: startTime,
      originalEndTime: endTime,
      newStartTime: startTime,
      newEndTime: endTime,
      days: {},
      newDays: {},
    ),
  );

  return TimeConversionResponse(
    startTime: timeMapping.originalStartTime,
    endTime: timeMapping.originalEndTime,
    days: timeMapping.days,
  );
}

final timeMappings = [
  // academic courses (sunday - tuesday - thursday)
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 30),
    originalEndTime: const TimeOfDay(hour: 9, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 0),
    newEndTime: const TimeOfDay(hour: 10, minute: 35),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 0),
    originalEndTime: const TimeOfDay(hour: 9, minute: 20),
    newStartTime: const TimeOfDay(hour: 9, minute: 45),
    newEndTime: const TimeOfDay(hour: 10, minute: 35),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 7, minute: 30),
    originalEndTime: const TimeOfDay(hour: 9, minute: 20),
    newStartTime: const TimeOfDay(hour: 9, minute: 30),
    newEndTime: const TimeOfDay(hour: 10, minute: 40),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 30),
    originalEndTime: const TimeOfDay(hour: 10, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 00),
    newEndTime: const TimeOfDay(hour: 11, minute: 10),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 30),
    originalEndTime: const TimeOfDay(hour: 11, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 00),
    newEndTime: const TimeOfDay(hour: 11, minute: 40),
    days: {Day.thu},
    newDays: {Day.thu},
  ),
  // 1
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 30),
    originalEndTime: const TimeOfDay(hour: 10, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 40),
    newEndTime: const TimeOfDay(hour: 11, minute: 15),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 30),
    originalEndTime: const TimeOfDay(hour: 10, minute: 50),
    newStartTime: const TimeOfDay(hour: 10, minute: 40),
    newEndTime: const TimeOfDay(hour: 11, minute: 30),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 30),
    originalEndTime: const TimeOfDay(hour: 11, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 40),
    newEndTime: const TimeOfDay(hour: 11, minute: 50),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 30),
    originalEndTime: const TimeOfDay(hour: 11, minute: 50),
    newStartTime: const TimeOfDay(hour: 10, minute: 40),
    newEndTime: const TimeOfDay(hour: 12, minute: 10),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 30),
    originalEndTime: const TimeOfDay(hour: 12, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 40),
    newEndTime: const TimeOfDay(hour: 12, minute: 20),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  // 2
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 30),
    originalEndTime: const TimeOfDay(hour: 11, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 20),
    newEndTime: const TimeOfDay(hour: 11, minute: 55),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 11, minute: 00),
    originalEndTime: const TimeOfDay(hour: 12, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 30),
    newEndTime: const TimeOfDay(hour: 12, minute: 20),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 30),
    originalEndTime: const TimeOfDay(hour: 12, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 20),
    newEndTime: const TimeOfDay(hour: 12, minute: 30),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  // 3
  // Dohur Prayer - (1 3 5) - (12:00 - 12:30)
  // 4
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 11, minute: 30),
    originalEndTime: const TimeOfDay(hour: 12, minute: 20),
    newStartTime: const TimeOfDay(hour: 12, minute: 30),
    newEndTime: const TimeOfDay(hour: 13, minute: 05),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 11, minute: 30),
    originalEndTime: const TimeOfDay(hour: 13, minute: 20),
    newStartTime: const TimeOfDay(hour: 12, minute: 30),
    newEndTime: const TimeOfDay(hour: 13, minute: 40),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  // 5
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 12, minute: 30),
    originalEndTime: const TimeOfDay(hour: 13, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 10),
    newEndTime: const TimeOfDay(hour: 13, minute: 45),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 12, minute: 00),
    originalEndTime: const TimeOfDay(hour: 12, minute: 50),
    newStartTime: const TimeOfDay(hour: 13, minute: 10),
    newEndTime: const TimeOfDay(hour: 13, minute: 45),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 12, minute: 30),
    originalEndTime: const TimeOfDay(hour: 14, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 10),
    newEndTime: const TimeOfDay(hour: 14, minute: 20),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 12, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 10),
    newEndTime: const TimeOfDay(hour: 14, minute: 50),
    days: {Day.thu},
    newDays: {Day.thu},
  ),
  // 6
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 30),
    originalEndTime: const TimeOfDay(hour: 14, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 50),
    newEndTime: const TimeOfDay(hour: 14, minute: 25),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 30),
    originalEndTime: const TimeOfDay(hour: 14, minute: 50),
    newStartTime: const TimeOfDay(hour: 13, minute: 50),
    newEndTime: const TimeOfDay(hour: 14, minute: 40),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 50),
    newEndTime: const TimeOfDay(hour: 15, minute: 00),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 00),
    originalEndTime: const TimeOfDay(hour: 15, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 50),
    newEndTime: const TimeOfDay(hour: 15, minute: 20),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 50),
    newEndTime: const TimeOfDay(hour: 15, minute: 30),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 00),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 50),
    newEndTime: const TimeOfDay(hour: 15, minute: 50),
    days: {Day.sun, Day.tue},
    newDays: {Day.sun, Day.tue},
  ),
  // 7
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 14, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 20),
    newStartTime: const TimeOfDay(hour: 14, minute: 30),
    newEndTime: const TimeOfDay(hour: 15, minute: 05),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 14, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 50),
    newStartTime: const TimeOfDay(hour: 14, minute: 30),
    newEndTime: const TimeOfDay(hour: 15, minute: 20),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 14, minute: 30),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 14, minute: 30),
    newEndTime: const TimeOfDay(hour: 15, minute: 40),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 14, minute: 30),
    originalEndTime: const TimeOfDay(hour: 17, minute: 20),
    newStartTime: const TimeOfDay(hour: 14, minute: 30),
    newEndTime: const TimeOfDay(hour: 16, minute: 10),
    days: {Day.tue},
    newDays: {Day.tue},
  ),
  // 8
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 15, minute: 30),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 15, minute: 10),
    newEndTime: const TimeOfDay(hour: 15, minute: 45),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 15, minute: 30),
    originalEndTime: const TimeOfDay(hour: 17, minute: 20),
    newStartTime: const TimeOfDay(hour: 15, minute: 10),
    newEndTime: const TimeOfDay(hour: 16, minute: 20),
    days: {Day.tue},
    newDays: {Day.tue},
  ),
  // 9
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 16, minute: 30),
    originalEndTime: const TimeOfDay(hour: 17, minute: 20),
    newStartTime: const TimeOfDay(hour: 15, minute: 50),
    newEndTime: const TimeOfDay(hour: 16, minute: 25),
    days: {Day.thu},
    newDays: {Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 17, minute: 30),
    originalEndTime: const TimeOfDay(hour: 18, minute: 20),
    newStartTime: const TimeOfDay(hour: 15, minute: 50),
    newEndTime: const TimeOfDay(hour: 16, minute: 25),
    days: {Day.sun, Day.tue, Day.thu},
    newDays: {Day.sun, Day.tue, Day.thu},
  ),
  // 10
  // interlink courses (sunday - monday - tuesday - wednesday - thursday)
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 30),
    originalEndTime: const TimeOfDay(hour: 10, minute: 30),
    newStartTime: const TimeOfDay(hour: 10, minute: 00),
    newEndTime: const TimeOfDay(hour: 11, minute: 10),
    days: {Day.sun, Day.mon, Day.tue, Day.wed, Day.thu},
    newDays: {Day.sun, Day.mon, Day.tue, Day.wed, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 30),
    originalEndTime: const TimeOfDay(hour: 12, minute: 30),
    newStartTime: const TimeOfDay(hour: 11, minute: 20),
    newEndTime: const TimeOfDay(hour: 12, minute: 30),
    days: {Day.sun, Day.mon, Day.tue, Day.wed, Day.thu},
    newDays: {Day.sun, Day.mon, Day.tue, Day.wed, Day.thu},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 30),
    newStartTime: const TimeOfDay(hour: 13, minute: 50),
    newEndTime: const TimeOfDay(hour: 15, minute: 00),
    days: {Day.sun, Day.mon, Day.tue, Day.wed, Day.thu},
    newDays: {Day.sun, Day.mon, Day.tue, Day.wed, Day.thu},
  ),
  // academic courses (monday - wednesday)
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 7, minute: 30),
    originalEndTime: const TimeOfDay(hour: 8, minute: 00),
    newStartTime: const TimeOfDay(hour: 9, minute: 30),
    newEndTime: const TimeOfDay(hour: 9, minute: 50),
    days: {Day.wed},
    newDays: {Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 7, minute: 30),
    originalEndTime: const TimeOfDay(hour: 9, minute: 50),
    newStartTime: const TimeOfDay(hour: 9, minute: 30),
    newEndTime: const TimeOfDay(hour: 11, minute: 00),
    days: {Day.mon},
    newDays: {Day.mon},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 00),
    originalEndTime: const TimeOfDay(hour: 8, minute: 50),
    newStartTime: const TimeOfDay(hour: 9, minute: 35),
    newEndTime: const TimeOfDay(hour: 10, minute: 10),
    days: {Day.wed},
    newDays: {Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 00),
    originalEndTime: const TimeOfDay(hour: 10, minute: 00),
    newStartTime: const TimeOfDay(hour: 9, minute: 50),
    newEndTime: const TimeOfDay(hour: 11, minute: 00),
    days: {Day.wed},
    newDays: {Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 00),
    originalEndTime: const TimeOfDay(hour: 9, minute: 50),
    newStartTime: const TimeOfDay(hour: 9, minute: 50),
    newEndTime: const TimeOfDay(hour: 11, minute: 00),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 30),
    originalEndTime: const TimeOfDay(hour: 9, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 10),
    newEndTime: const TimeOfDay(hour: 10, minute: 45),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 30),
    originalEndTime: const TimeOfDay(hour: 9, minute: 50),
    newStartTime: const TimeOfDay(hour: 10, minute: 10),
    newEndTime: const TimeOfDay(hour: 11, minute: 00),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 30),
    originalEndTime: const TimeOfDay(hour: 10, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 10),
    newEndTime: const TimeOfDay(hour: 11, minute: 20),
    days: {Day.mon},
    newDays: {Day.mon},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 8, minute: 30),
    originalEndTime: const TimeOfDay(hour: 11, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 10),
    newEndTime: const TimeOfDay(hour: 11, minute: 50),
    days: {Day.wed},
    newDays: {Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 00),
    originalEndTime: const TimeOfDay(hour: 10, minute: 20),
    newStartTime: const TimeOfDay(hour: 10, minute: 100),
    newEndTime: const TimeOfDay(hour: 11, minute: 00),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 00),
    originalEndTime: const TimeOfDay(hour: 0, minute: 50),
    newStartTime: const TimeOfDay(hour: 10, minute: 10),
    newEndTime: const TimeOfDay(hour: 10, minute: 45),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 00),
    originalEndTime: const TimeOfDay(hour: 10, minute: 50),
    newStartTime: const TimeOfDay(hour: 11, minute: 00),
    newEndTime: const TimeOfDay(hour: 11, minute: 35),
    days: {Day.wed},
    newDays: {Day.wed},
  ),
  // 1
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 30),
    originalEndTime: const TimeOfDay(hour: 11, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 11, minute: 45),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 30),
    originalEndTime: const TimeOfDay(hour: 10, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 11, minute: 45),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 00),
    originalEndTime: const TimeOfDay(hour: 11, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 12, minute: 00),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 00),
    originalEndTime: const TimeOfDay(hour: 11, minute: 50),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 12, minute: 20),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 9, minute: 30),
    originalEndTime: const TimeOfDay(hour: 11, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 12, minute: 20),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 30),
    originalEndTime: const TimeOfDay(hour: 12, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 12, minute: 20),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 11, minute: 00),
    originalEndTime: const TimeOfDay(hour: 12, minute: 50),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 12, minute: 20),
    days: {Day.wed},
    newDays: {Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 00),
    originalEndTime: const TimeOfDay(hour: 12, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 12, minute: 40),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 00),
    originalEndTime: const TimeOfDay(hour: 12, minute: 50),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 12, minute: 50),
    days: {Day.mon},
    newDays: {Day.mon},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 10, minute: 30),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 11, minute: 10),
    newEndTime: const TimeOfDay(hour: 14, minute: 40),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 12, minute: 00),
    originalEndTime: const TimeOfDay(hour: 12, minute: 50),
    newStartTime: const TimeOfDay(hour: 12, minute: 20),
    newEndTime: const TimeOfDay(hour: 12, minute: 55),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  // 2
  // Dohur Prayer - (2 4) - (12:00 - 12:30)
  // 3
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 11, minute: 30),
    originalEndTime: const TimeOfDay(hour: 12, minute: 20),
    newStartTime: const TimeOfDay(hour: 12, minute: 30),
    newEndTime: const TimeOfDay(hour: 13, minute: 05),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 11, minute: 30),
    originalEndTime: const TimeOfDay(hour: 12, minute: 50),
    newStartTime: const TimeOfDay(hour: 12, minute: 30),
    newEndTime: const TimeOfDay(hour: 13, minute: 20),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 11, minute: 30),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 12, minute: 30),
    newEndTime: const TimeOfDay(hour: 15, minute: 30),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  // 4
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 12, minute: 30),
    originalEndTime: const TimeOfDay(hour: 13, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 25),
    newEndTime: const TimeOfDay(hour: 14, minute: 00),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 00),
    originalEndTime: const TimeOfDay(hour: 13, minute: 50),
    newStartTime: const TimeOfDay(hour: 13, minute: 25),
    newEndTime: const TimeOfDay(hour: 14, minute: 00),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 00),
    originalEndTime: const TimeOfDay(hour: 14, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 25),
    newEndTime: const TimeOfDay(hour: 14, minute: 15),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 00),
    originalEndTime: const TimeOfDay(hour: 14, minute: 50),
    newStartTime: const TimeOfDay(hour: 13, minute: 25),
    newEndTime: const TimeOfDay(hour: 14, minute: 35),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 00),
    originalEndTime: const TimeOfDay(hour: 15, minute: 50),
    newStartTime: const TimeOfDay(hour: 13, minute: 25),
    newEndTime: const TimeOfDay(hour: 15, minute: 05),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 30),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 25),
    newEndTime: const TimeOfDay(hour: 15, minute: 05),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 00),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 25),
    newEndTime: const TimeOfDay(hour: 15, minute: 25),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 12, minute: 30),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 13, minute: 25),
    newEndTime: const TimeOfDay(hour: 15, minute: 45),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 14, minute: 00),
    originalEndTime: const TimeOfDay(hour: 15, minute: 50),
    newStartTime: const TimeOfDay(hour: 14, minute: 00),
    newEndTime: const TimeOfDay(hour: 15, minute: 10),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 15, minute: 00),
    originalEndTime: const TimeOfDay(hour: 15, minute: 50),
    newStartTime: const TimeOfDay(hour: 14, minute: 35),
    newEndTime: const TimeOfDay(hour: 15, minute: 10),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  // 5
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 14, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 20),
    newStartTime: const TimeOfDay(hour: 14, minute: 20),
    newEndTime: const TimeOfDay(hour: 14, minute: 55),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 14, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 50),
    newStartTime: const TimeOfDay(hour: 14, minute: 20),
    newEndTime: const TimeOfDay(hour: 15, minute: 10),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 14, minute: 30),
    originalEndTime: const TimeOfDay(hour: 15, minute: 20),
    newStartTime: const TimeOfDay(hour: 14, minute: 20),
    newEndTime: const TimeOfDay(hour: 15, minute: 30),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  // 6
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 15, minute: 30),
    originalEndTime: const TimeOfDay(hour: 16, minute: 20),
    newStartTime: const TimeOfDay(hour: 15, minute: 20),
    newEndTime: const TimeOfDay(hour: 15, minute: 55),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 16, minute: 00),
    originalEndTime: const TimeOfDay(hour: 17, minute: 50),
    newStartTime: const TimeOfDay(hour: 15, minute: 20),
    newEndTime: const TimeOfDay(hour: 16, minute: 30),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 16, minute: 30),
    originalEndTime: const TimeOfDay(hour: 17, minute: 20),
    newStartTime: const TimeOfDay(hour: 16, minute: 00),
    newEndTime: const TimeOfDay(hour: 16, minute: 35),
    days: {Day.wed},
    newDays: {Day.wed},
  ),
  // 7
  TimeMapping(
    originalStartTime: const TimeOfDay(hour: 13, minute: 30),
    originalEndTime: const TimeOfDay(hour: 14, minute: 20),
    newStartTime: const TimeOfDay(hour: 16, minute: 00),
    newEndTime: const TimeOfDay(hour: 16, minute: 35),
    days: {Day.mon, Day.wed},
    newDays: {Day.mon, Day.wed},
  ),
];
