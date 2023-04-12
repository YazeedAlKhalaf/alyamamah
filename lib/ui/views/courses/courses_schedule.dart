import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/day.dart';
import 'package:alyamamah/core/extensions/int.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/ui/views/courses/courses_column.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/courses/schedule_grid.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CoursesSchedule extends StatelessWidget {
  final Map<Day, List<ScheduleEntry>> scheduleDays;
  final int startHour;
  final double cellHeight;
  final void Function(ScheduleEntry) onCourseTap;
  final Future<void> Function() onRefresh;

  const CoursesSchedule({
    super.key,
    required this.scheduleDays,
    this.startHour = 8,
    this.cellHeight = 60,
    required this.onCourseTap,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle todayDayStyle(bool isToday) {
      return TextStyle(
        color: isToday ? null : Theme.of(context).colorScheme.outlineVariant,
        fontWeight: isToday ? FontWeight.bold : null,
      );
    }

    return Column(
      children: [
        Row(
          children: scheduleDays.keys.map((currentDay) {
            final today = DateTime.now().weekday.mapToDay();
            final isWeekend = today == Day.sat || today == Day.fri;

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: Constants.spacing),
                child: Text(
                  currentDay.mapToString(context),
                  style: todayDayStyle(
                    currentDay == today || (isWeekend && currentDay == Day.sun),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              ScheduleGrid(
                cellHeight: cellHeight,
                horizontalSegments: 5,
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return RefreshIndicator(
                    onRefresh: onRefresh,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: scheduleDays.values.mapIndexed(
                            (int i, List<ScheduleEntry> scheduleEntries) {
                              return CoursesColumn(
                                startHour: startHour,
                                cellHeight: cellHeight,
                                scheduleEntries: scheduleEntries,
                                onCourseTap: onCourseTap,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
