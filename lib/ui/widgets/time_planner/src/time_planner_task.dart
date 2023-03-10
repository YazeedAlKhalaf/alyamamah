import 'package:flutter/material.dart';

import './config/global_config.dart' as config;
import './time_planner_date_time.dart';

/// Widget that show on time planner as the tasks
class TimePlannerTask extends StatelessWidget {
  /// Minutes duration of task or object
  final int minutesDuration;

  /// Days duration of task or object, default is 1
  final int? daysDuration;

  /// When this task will be happen
  final TimePlannerDateTime dateTime;

  /// Background color of task
  final Color? color;

  /// This will be happen when user tap on task, for example show a dialog or navigate to other page
  final Function? onTap;

  /// Show this child on the task
  ///
  /// Typically an [Text].
  final Widget? child;

  /// Widget that show on time planner as the tasks
  const TimePlannerTask({
    Key? key,
    required this.minutesDuration,
    required this.dateTime,
    this.daysDuration,
    this.color,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ((config.cellHeight! * (dateTime.hour - config.startHour)) +
              ((dateTime.minutes * config.cellHeight!) / 60))
          .toDouble(),
      left: config.cellWidth! * dateTime.day.toDouble(),
      child: SizedBox(
        width: (config.cellWidth!.toDouble() * (daysDuration ?? 1)) -
            config.horizontalTaskPadding!,
        child: Padding(
          padding:
              EdgeInsets.only(left: config.horizontalTaskPadding!.toDouble()),
          child: Material(
            elevation: 3,
            borderRadius: config.borderRadius,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: onTap as void Function()? ?? () {},
                  child: Container(
                    height: ((minutesDuration.toDouble() * config.cellHeight!) /
                        60), //60 minutes
                    width: (config.cellWidth!.toDouble() * (daysDuration ?? 1)),
                    // (daysDuration! >= 1 ? daysDuration! : 1)),
                    decoration: BoxDecoration(
                      borderRadius: config.borderRadius,
                      color: color ??
                          Theme.of(context).colorScheme.primaryContainer,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    child: Center(
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
