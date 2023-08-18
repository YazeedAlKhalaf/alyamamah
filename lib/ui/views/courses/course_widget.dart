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
        color: generateBorderColor(generateColor(scheduleEntry.courseCode)),
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

Color generateColor(String input) {
  List<String> parts = input.split(' ');

  String subject;
  String number;

  if (parts.length != 2) {
    subject = input;
    number = input;
  } else {
    subject = parts[0];
    number = parts[1];
  }

  // Hash the subject to determine the hue.
  final subjectBytes = utf8.encode(subject);
  final subjectDigest = sha256.convert(subjectBytes);
  final hueByteValue = (subjectDigest.bytes[8] << 8) + subjectDigest.bytes[9];
  final hue = (hueByteValue % 65536) / 65536.0 * 360.0;

  // Hash the number to determine saturation and lightness.
  final numberBytes = utf8.encode(number);
  final numberDigest = sha256.convert(numberBytes);

  double saturation = 0.4 + (numberDigest.bytes[10] % 51 / 100);
  double lightness = 0.4 + (numberDigest.bytes[11] % 31 / 100);

  // Adjust lightness and saturation
  // if the color falls within the green spectrum.
  if (hue >= 60 && hue <= 180) {
    saturation = 0.6;
    lightness = 0.5;
  }

  return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
}

Color generateBorderColor(Color originalColor) {
  final hslOriginal = HSLColor.fromColor(originalColor);

  // Adjust lightness for the border color
  // If the original color is quite dark, we'll make the border lighter.
  // Otherwise, we'll make it darker.
  double borderLightness = (hslOriginal.lightness < 0.5)
      ? hslOriginal.lightness + 0.15
      : hslOriginal.lightness - 0.15;
  borderLightness = borderLightness.clamp(0.0, 1.0);

  final borderColor = HSLColor.fromAHSL(
    hslOriginal.alpha,
    hslOriginal.hue,
    hslOriginal.saturation,
    borderLightness,
  );

  return borderColor.toColor();
}
