import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/day.dart';
import 'package:alyamamah/core/extensions/int.dart';
import 'package:alyamamah/core/extensions/time_of_day.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/courses/course_widget.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

const startHour = 8;
const cellHeight = 60;

class CoursesSchedule extends StatelessWidget {
  final Map<Day, List<ScheduleEntry>> scheduleDays;
  final void Function(ScheduleEntry) onCourseTap;

  const CoursesSchedule({
    super.key,
    required this.scheduleDays,
    required this.onCourseTap,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle todayDayStyle(bool isToday) {
      return TextStyle(
        color: isToday ? null : Theme.of(context).colorScheme.outlineVariant,
        fontWeight: isToday ? FontWeight.bold : null,
      );
    }

    return Row(
      children: scheduleDays.values.mapIndexed(
        (int i, List<ScheduleEntry> scheduleEntries) {
          final today = DateTime.now().weekday.mapToDay();
          final currentDay = scheduleDays.keys.elementAt(i);
          final isWeekend = today == Day.sat || today == Day.fri;

          return Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  currentDay.mapToString(context),
                  style: todayDayStyle(
                    currentDay == today || (isWeekend && currentDay == Day.sun),
                  ),
                ),
                const SizedBox(height: Constants.spacing),
                Expanded(
                  child: Stack(
                    children: scheduleEntries.map(
                      (ScheduleEntry scheduleEntry) {
                        return Positioned(
                          left: 0,
                          right: 0,
                          top: (((scheduleEntry.startTime.hour - startHour) *
                                      60) +
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
        },
      ).toList(),
    );
  }
}
