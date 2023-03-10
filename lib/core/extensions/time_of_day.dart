import 'package:flutter/material.dart';

extension TimeOfDayX on TimeOfDay {
  int compareTo(TimeOfDay other) {
    final now = DateTime.now();
    final thisDate = now.copyWith(
      hour: hour,
      minute: minute,
    );
    final otherDate = now.copyWith(
      hour: other.hour,
      minute: other.minute,
    );

    return thisDate.compareTo(otherDate);
  }

  Duration difference(TimeOfDay other) {
    int hourDifference = other.hour - hour;
    int minuteDifference = other.minute - minute;
    return Duration(hours: hourDifference, minutes: minuteDifference);
  }
}
