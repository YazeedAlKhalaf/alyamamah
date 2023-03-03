import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:flutter/material.dart';

extension DayX on Day {
  String mapToString(BuildContext context) {
    switch (this) {
      case Day.sun:
        return context.s.sunday;
      case Day.mon:
        return context.s.monday;
      case Day.tue:
        return context.s.tuesday;
      case Day.wed:
        return context.s.wednesday;
      case Day.thu:
        return context.s.thursday;
      case Day.fri:
        return context.s.friday;
      case Day.sat:
        return context.s.saturday;
    }
  }
}
