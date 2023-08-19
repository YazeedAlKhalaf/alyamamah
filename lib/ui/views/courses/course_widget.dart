import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/utils.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  final double height;
  final ScheduleEntry scheduleEntry;
  final void Function()? onTap;
  final bool isSmall;

  const CourseWidget({
    super.key,
    required this.height,
    required this.scheduleEntry,
    required this.onTap,
    this.isSmall = true,
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
        color: Utils.generateBorderColor(
          Utils.generateColorFromCourse(scheduleEntry.courseCode),
        ),
        borderRadius: BorderRadius.circular(Constants.spacing),
      ),
      padding: switch (isSmall) {
        true => null,
        false => const EdgeInsets.symmetric(vertical: Constants.padding / 8),
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            Constants.spacing,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                scheduleEntry.startTime.format(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: switch (isSmall) {
                    true => 9,
                    false => null,
                  },
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 8),
              Text(
                '${scheduleEntry.courseCode}\n${scheduleEntry.room}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: switch (isSmall) {
                    true => height <= 70 ? 8 : 10,
                    false => null,
                  },
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 8),
              Text(
                scheduleEntry.endTime.format(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: switch (isSmall) {
                    true => 9,
                    false => null,
                  },
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
