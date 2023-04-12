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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: scheduleEntries.fold<double>(0,
                (double previousValue, ScheduleEntry entry) {
              final double entryTop =
                  (((entry.startTime.hour - startHour) * 60) +
                          entry.startTime.minute.toDouble()) *
                      cellHeight /
                      60;
              final double entryHeight = (entry.startTime
                          .difference(entry.endTime)
                          .inMinutes
                          .toDouble() *
                      cellHeight) /
                  60;

              return math.max(previousValue, entryTop + entryHeight);
            }),
            child: Stack(
              alignment: Alignment.topCenter,
              children: scheduleEntries.map(
                (ScheduleEntry scheduleEntry) {
                  return Positioned(
                    left: 2,
                    right: 2,
                    top: (((scheduleEntry.startTime.hour - startHour) * 60) +
                            scheduleEntry.startTime.minute.toDouble()) *
                        cellHeight /
                        60,
                    child: CourseWidget(
                      height: (scheduleEntry.startTime
                                  .difference(scheduleEntry.endTime)
                                  .inMinutes
                                  .toDouble() *
                              cellHeight) /
                          60,
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
        ],
      ),
    );
  }
}
