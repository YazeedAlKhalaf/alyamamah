import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
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
    return Container(
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
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            Constants.padding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                scheduleEntry.startTime.format(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 9,
                    ),
              ),
              const Spacer(flex: 8),
              Text(
                '${scheduleEntry.courseCode}\n${scheduleEntry.room}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height <= 70 ? 8 : 10,
                ),
              ),
              const Spacer(flex: 8),
              Text(
                scheduleEntry.endTime.format(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 9,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
