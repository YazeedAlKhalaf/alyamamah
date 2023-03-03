import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TimeOfDayX |', () {
    group('compareTo |', () {
      test(
        'should return -1 when comparing 11:30 AM to 11:30 PM.',
        () {
          expect(
            const TimeOfDay(hour: 11, minute: 30).compareTo(
              const TimeOfDay(hour: 23, minute: 30),
            ),
            -1,
          );
        },
      );

      test(
        'should return 1 when comparing 11:30 PM to 11:30 AM.',
        () {
          expect(
            const TimeOfDay(hour: 23, minute: 30).compareTo(
              const TimeOfDay(hour: 11, minute: 30),
            ),
            1,
          );
        },
      );

      test(
        'should return 0 when comparing 11:30 AM to 11:30 AM.',
        () {
          expect(
            const TimeOfDay(hour: 11, minute: 30).compareTo(
              const TimeOfDay(hour: 11, minute: 30),
            ),
            0,
          );
        },
      );
    });
  });
}
