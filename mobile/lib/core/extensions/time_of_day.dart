import 'dart:convert';

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

  int get inMinutes => hour * 60 + minute;

  Map<String, int> toMap() {
    return {'hour': hour, 'minute': minute};
  }
}

TimeOfDay timeOfDayFromJson(String json) {
  final map = jsonDecode(json) as Map<String, int>;

  return TimeOfDay(
    hour: map['hour'] as int,
    minute: map['minute'] as int,
  );
}
