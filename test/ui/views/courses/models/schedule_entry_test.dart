import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScheduleEntry |', () {
    test(
      'should be able to create an instance.',
      () {
        final startTime = TimeOfDay.now();
        final endTime = TimeOfDay.now();
        final scheduleEntry = ScheduleEntry(
          startTime: startTime,
          endTime: endTime,
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
        );

        expect(scheduleEntry, isA<ScheduleEntry>());
        expect(scheduleEntry.startTime, startTime);
        expect(scheduleEntry.endTime, endTime);
        expect(scheduleEntry.room, 'room');
        expect(scheduleEntry.activityDesc, 'activityDesc');
        expect(scheduleEntry.courseName, 'courseName');
        expect(scheduleEntry.courseCode, 'courseCode');
      },
    );

    test(
      'should verify copyWith works.',
      () {
        final scheduleEntry = ScheduleEntry(
          startTime: TimeOfDay.now(),
          endTime: TimeOfDay.now(),
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
        );

        final startTime = TimeOfDay.now();
        final endTime = TimeOfDay.now();
        final newScheduleEntry = scheduleEntry.copyWith(
          startTime: startTime,
          endTime: endTime,
          room: 'room2',
          activityDesc: 'activityDesc2',
          courseName: 'courseName2',
          courseCode: 'courseCode2',
        );

        expect(newScheduleEntry.startTime, startTime);
        expect(newScheduleEntry.endTime, endTime);
        expect(newScheduleEntry.room, 'room2');
        expect(newScheduleEntry.activityDesc, 'activityDesc2');
        expect(newScheduleEntry.courseName, 'courseName2');
        expect(newScheduleEntry.courseCode, 'courseCode2');
      },
    );

    test(
      'should verify copyWith works when no values change.',
      () {
        final startTime = TimeOfDay.now();
        final endTime = TimeOfDay.now();

        final scheduleEntry = ScheduleEntry(
          startTime: startTime,
          endTime: endTime,
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
        );

        final newScheduleEntry = scheduleEntry.copyWith();

        expect(newScheduleEntry.startTime, startTime);
        expect(newScheduleEntry.endTime, endTime);
        expect(newScheduleEntry.room, 'room');
        expect(newScheduleEntry.activityDesc, 'activityDesc');
        expect(newScheduleEntry.courseName, 'courseName');
        expect(newScheduleEntry.courseCode, 'courseCode');
      },
    );

    test(
      'verify equality works.',
      () {
        final startTime = TimeOfDay.now();
        final endTime = TimeOfDay.now();

        final scheduleEntry = ScheduleEntry(
          startTime: startTime,
          endTime: endTime,
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
        );

        final scheduleEntry2 = ScheduleEntry(
          startTime: startTime,
          endTime: endTime,
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
        );

        expect(scheduleEntry, scheduleEntry2);
      },
    );

    test(
      'verify hashcode works.',
      () {
        final startTime = TimeOfDay.now();
        final endTime = TimeOfDay.now();

        final scheduleEntry = ScheduleEntry(
          startTime: startTime,
          endTime: endTime,
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
        );

        final scheduleEntry2 = ScheduleEntry(
          startTime: startTime,
          endTime: endTime,
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
        );

        expect(scheduleEntry.hashCode, scheduleEntry2.hashCode);
      },
    );
  });
}
