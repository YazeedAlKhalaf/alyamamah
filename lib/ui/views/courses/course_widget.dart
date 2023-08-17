import 'dart:convert';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/ui/views/courses/models/schedule_entry.dart';
import 'package:crypto/crypto.dart';
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
        color: generateColor(
          scheduleEntry.courseCode,
          brightness: Theme.of(context).brightness,
        ),
        borderRadius: BorderRadius.circular(
          Constants.spacing,
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 1,
        ),
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
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color generateColor(String input, {required Brightness brightness}) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);

  // sha-256 is made of 32 bytes, so anything between 0 and 31 is okay to use.
  final hue = (digest.bytes[8] / 255.0) * 360.0;

  double lightness;
  if (brightness == Brightness.light) {
    lightness = (digest.bytes[9] % 35) / 100 + 0.6;
  } else {
    lightness = (digest.bytes[9] % 30) / 100 + 0.1;
  }

  return HSLColor.fromAHSL(1.0, hue, 0.75, lightness).toColor();
}
