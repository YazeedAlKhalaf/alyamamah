import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:alyamamah/ui/widgets/scrolling_widget.dart';
import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  final double height;
  final ScheduleEntry scheduleEntry;
  final void Function()? onTap;

  const CourseWidget({
    super.key,
    required this.height,
    required this.scheduleEntry,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: Constants.spacing / 4,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(
            Constants.padding,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Text(
              scheduleEntry.startTime.format(context),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                  ),
            ),
            const Spacer(flex: 8),
            if (height >= 80) ...[
              Text(
                scheduleEntry.courseCode,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 10,
                    ),
              ),
              Text(
                scheduleEntry.room,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ] else
              ScrollingWidget(
                children: [
                  Text(
                    scheduleEntry.courseCode,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    scheduleEntry.room,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            const Spacer(flex: 8),
            Text(
              scheduleEntry.endTime.format(context),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                  ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
