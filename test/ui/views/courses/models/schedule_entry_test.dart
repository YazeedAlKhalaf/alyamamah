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
          instructor: 'instructor',
          creditHours: 'creditHours',
          campusName: 'campusName',
          courseDeleted: false,
          section: 'section',
        );

        expect(scheduleEntry, isA<ScheduleEntry>());
        expect(scheduleEntry.startTime, startTime);
        expect(scheduleEntry.endTime, endTime);
        expect(scheduleEntry.room, 'room');
        expect(scheduleEntry.activityDesc, 'activityDesc');
        expect(scheduleEntry.courseName, 'courseName');
        expect(scheduleEntry.courseCode, 'courseCode');
        expect(scheduleEntry.instructor, 'instructor');
        expect(scheduleEntry.creditHours, 'creditHours');
        expect(scheduleEntry.campusName, 'campusName');
        expect(scheduleEntry.courseDeleted, false);
        expect(scheduleEntry.section, 'section');
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
          instructor: 'instructor',
          creditHours: 'creditHours',
          campusName: 'campusName',
          courseDeleted: false,
          section: 'section',
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
          instructor: 'instructor2',
          creditHours: 'creditHours2',
          campusName: 'campusName2',
          courseDeleted: true,
          section: 'section2',
        );

        expect(newScheduleEntry.startTime, startTime);
        expect(newScheduleEntry.endTime, endTime);
        expect(newScheduleEntry.room, 'room2');
        expect(newScheduleEntry.activityDesc, 'activityDesc2');
        expect(newScheduleEntry.courseName, 'courseName2');
        expect(newScheduleEntry.courseCode, 'courseCode2');
        expect(newScheduleEntry.instructor, 'instructor2');
        expect(newScheduleEntry.creditHours, 'creditHours2');
        expect(newScheduleEntry.campusName, 'campusName2');
        expect(newScheduleEntry.courseDeleted, true);
        expect(newScheduleEntry.section, 'section2');
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
          instructor: 'instructor',
          creditHours: 'creditHours',
          campusName: 'campusName',
          courseDeleted: false,
          section: 'section',
        );

        final newScheduleEntry = scheduleEntry.copyWith();

        expect(newScheduleEntry.startTime, startTime);
        expect(newScheduleEntry.endTime, endTime);
        expect(newScheduleEntry.room, 'room');
        expect(newScheduleEntry.activityDesc, 'activityDesc');
        expect(newScheduleEntry.courseName, 'courseName');
        expect(newScheduleEntry.courseCode, 'courseCode');
        expect(newScheduleEntry.instructor, 'instructor');
        expect(newScheduleEntry.creditHours, 'creditHours');
        expect(newScheduleEntry.campusName, 'campusName');
        expect(newScheduleEntry.courseDeleted, false);
        expect(newScheduleEntry.section, 'section');
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
          instructor: 'instructor',
          creditHours: 'creditHours',
          campusName: 'campusName',
          courseDeleted: false,
          section: 'section',
        );

        final scheduleEntry2 = ScheduleEntry(
          startTime: startTime,
          endTime: endTime,
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
          instructor: 'instructor',
          creditHours: 'creditHours',
          campusName: 'campusName',
          courseDeleted: false,
          section: 'section',
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
          instructor: 'instructor',
          creditHours: 'creditHours',
          campusName: 'campusName',
          courseDeleted: false,
          section: 'section',
        );

        final scheduleEntry2 = ScheduleEntry(
          startTime: startTime,
          endTime: endTime,
          room: 'room',
          activityDesc: 'activityDesc',
          courseName: 'courseName',
          courseCode: 'courseCode',
          instructor: 'instructor',
          creditHours: 'creditHours',
          campusName: 'campusName',
          courseDeleted: false,
          section: 'section',
        );

        expect(scheduleEntry.hashCode, scheduleEntry2.hashCode);
      },
    );
  });
}
