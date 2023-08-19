import 'dart:math' as math;

import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:alyamamah/ui/views/courses/course_widget.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:flutter/material.dart';

class CoursesColumn extends StatelessWidget {
  final int startHour;
  final double cellHeight;
  final List<ScheduleEntry> scheduleEntries;
  final void Function(ScheduleEntry) onCourseTap;

  const CoursesColumn({
    super.key,
    required this.startHour,
    required this.cellHeight,
    required this.scheduleEntries,
    required this.onCourseTap,
  });

  double _computeMaxHeight() {
    return scheduleEntries.fold<double>(0,
        (double previousValue, ScheduleEntry entry) {
      double entryTop = _computeEntryTop(entry);
      double entryHeight = _computeEntryHeight(entry);
      return math.max(previousValue, entryTop + entryHeight);
    });
  }

  double _computeEntryTop(ScheduleEntry entry) {
    final minutesFromStart =
        (entry.startTime.hour - startHour) * 60 + entry.startTime.minute;
    return (minutesFromStart * cellHeight) / 60;
  }

  double _computeEntryHeight(ScheduleEntry entry) {
    final durationInMinutes =
        entry.startTime.difference(entry.endTime).inMinutes;
    return (durationInMinutes * cellHeight) / 60;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: _computeMaxHeight(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: scheduleEntries.map(
            (ScheduleEntry scheduleEntry) {
              return Positioned(
                left: 2,
                right: 2,
                top: _computeEntryTop(scheduleEntry),
                child: CourseWidget(
                  height: _computeEntryHeight(scheduleEntry),
                  scheduleEntry: scheduleEntry,
                  onTap: () {
                    onCourseTap(scheduleEntry);
                  },
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
