import 'package:flutter/material.dart';

extension StringX on String {
  TimeOfDay mapToTimeOfDay() {
    // ' 11:30 AM '
    final trimmed = trim();

    // first ['11:30', 'AM']
    // then ['11', '30']
    final timeParts = trimmed.split(' ')[0].split(':');
    int hour = int.parse(timeParts[0].trim());
    int minute = int.parse(timeParts[1].trim());

    final isPM = (trimmed.contains('pm') ||
            trimmed.contains('PM') ||
            trimmed.contains('م')) &&
        hour != 12;

    if (isPM) {
      hour += 12;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }
}
