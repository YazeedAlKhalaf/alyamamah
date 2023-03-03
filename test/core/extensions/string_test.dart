import 'package:alyamamah/core/extensions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringX |', () {
    group('mapToTimeOfDay |', () {
      test(
        'should get time of day for " 11:30 AM ".',
        () {
          expect(
            ' 11:30 AM '.mapToTimeOfDay(),
            const TimeOfDay(hour: 11, minute: 30),
          );
        },
      );

      test(
        'should get time of day for "11:30 AM".',
        () {
          expect(
            '11:30 AM'.mapToTimeOfDay(),
            const TimeOfDay(hour: 11, minute: 30),
          );
        },
      );

      test(
        'should get time of day for "11:30 PM".',
        () {
          expect(
            '11:30 PM'.mapToTimeOfDay(),
            const TimeOfDay(hour: 23, minute: 30),
          );
        },
      );

      test(
        'should get time of day for "11:30 pm".',
        () {
          expect(
            '11:30 PM'.mapToTimeOfDay(),
            const TimeOfDay(hour: 23, minute: 30),
          );
        },
      );

      test(
        'should get time of day for "11:30 م".',
        () {
          expect(
            '11:30 م'.mapToTimeOfDay(),
            const TimeOfDay(hour: 23, minute: 30),
          );
        },
      );
    });
  });
}
