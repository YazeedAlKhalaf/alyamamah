import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:flutter/material.dart';

extension DayX on Day {
  String mapToString(BuildContext context) {
    switch (this) {
      case Day.sun:
        return context.s.sun;
      case Day.mon:
        return context.s.mon;
      case Day.tue:
        return context.s.tue;
      case Day.wed:
        return context.s.wed;
      case Day.thu:
        return context.s.thu;
      case Day.fri:
        return context.s.fri;
      case Day.sat:
        return context.s.sat;
    }
  }
}
