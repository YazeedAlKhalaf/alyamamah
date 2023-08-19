import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/day.dart';
import 'package:alyamamah/core/extensions/int.dart';
import 'package:alyamamah/core/models/day.dart';
import 'package:alyamamah/core/providers/feature_flags/feature_flags_state_notifier.dart';
import 'package:alyamamah/ui/views/courses/courses_column.dart';
import 'package:alyamamah/ui/views/courses/current_hour_line.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/views/courses/schedule_grid.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursesSchedule extends ConsumerStatefulWidget {
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
  ConsumerState<CoursesSchedule> createState() => _CoursesScheduleState();
}

class _CoursesScheduleState extends ConsumerState<CoursesSchedule> {
  late ScrollController scrollController;
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    scrollController.addListener(() {
      setState(() {
        scrollOffset = scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isScheduleHourLabelsEnabled = ref
        .watch(featureFlagsStateNotifierProvider)
        .isScheduleHourLabelsEnabled;

    TextStyle todayDayStyle(bool isToday) {
      return TextStyle(
        color: isToday ? null : Theme.of(context).colorScheme.outline,
      );
    }

    return Row(
      children: [
        if (isScheduleHourLabelsEnabled)
          const SizedBox(width: Constants.padding * 2),
        Expanded(
          child: Column(
            children: [
              Row(
                children: widget.scheduleDays.keys.map((currentDay) {
                  final today = DateTime.now().weekday.mapToDay();
                  final isWeekend = today == Day.sat || today == Day.fri;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: Constants.spacing),
                      child: Text(
                        currentDay.mapToString(context),
                        style: todayDayStyle(
                          currentDay == today ||
                              (isWeekend && currentDay == Day.sun),
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
                      cellHeight: widget.cellHeight,
                      horizontalSegments: 5,
                      startHour: widget.startHour,
                      scrollOffset: scrollOffset,
                    ),
                    LayoutBuilder(
                      builder: (
                        BuildContext context,
                        BoxConstraints constraints,
                      ) {
                        return RefreshIndicator(
                          onRefresh: widget.onRefresh,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: widget.scheduleDays.values.mapIndexed(
                                  (int i, List<ScheduleEntry> scheduleEntries) {
                                    return CoursesColumn(
                                      startHour: widget.startHour,
                                      cellHeight: widget.cellHeight,
                                      scheduleEntries: scheduleEntries,
                                      onCourseTap: widget.onCourseTap,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    CurrentHourLine(
                      offset: scrollOffset,
                      startHour: widget.startHour,
                      cellHeight: widget.cellHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
