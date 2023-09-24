import 'dart:convert';

import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Utils {
  /// Generates a list of semester values between [start] and [end], inclusive.
  /// The [start] and [end] should be each of length 5, in the format of:
  /// - `YYYYX`, where `X` is the semester number.
  /// - `YYYY1` for First or Fall semester
  /// - `YYYY2` for Second or Spring semester
  /// - `YYYY3` for Third or Summer semester
  ///
  /// If the start or the end year is not in the format of `YYYYX`,
  /// it will return an empty list.
  static List<String> generateSemesterRange(String start, String end) {
    if (start.length < 5 || end.length < 5) {
      return [];
    }

    int startVal = int.parse(start);
    int endVal = int.parse(end);

    List<String> values = [];

    while (startVal <= endVal) {
      values.add(startVal.toString());

      int year = startVal ~/ 10;
      int semester = startVal % 10;

      if (semester < 3) {
        semester++;
      } else {
        semester = 1;
        year++;
      }

      startVal = year * 10 + semester;
    }

    return values;
  }

  static String semesterToReadable(BuildContext context, String semester) {
    if (semester.length < 5) {
      return '';
    }

    int year = int.parse(semester.substring(0, 4));
    int semesterNum = int.parse(semester.substring(4, 5));

    String readableSemester = '';
    switch (semesterNum) {
      case 1:
        readableSemester = context.s.first_semester_year1_year2(
          year,
          year + 1,
        );
        break;
      case 2:
        readableSemester = context.s.second_semester_year1_year2(
          year,
          year + 1,
        );
        break;
      case 3:
        readableSemester = context.s.summer_semester_year1_year2(
          year,
          year + 1,
        );
        break;
    }

    return readableSemester;
  }

  static Color? colorFromGrade(BuildContext context, String grade) {
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    switch (grade) {
      case 'A+':
      case 'أ+':
        return isDarkMode ? Colors.green[200] : Colors.green[800];
      case 'A':
      case 'أ':
        return isDarkMode ? Colors.green[300] : Colors.green;
      case 'B+':
      case 'ب+':
        return isDarkMode ? Colors.blue[300] : Colors.blue[700];
      case 'B':
      case 'ب':
        return isDarkMode ? Colors.blue[400] : Colors.blue;
      case 'C+':
      case 'ج+':
        return isDarkMode ? Colors.yellow[300] : Colors.yellow[700];
      case 'C':
      case 'ج':
        return isDarkMode ? Colors.yellow[400] : Colors.yellow;
      case 'D+':
      case 'د+':
        return isDarkMode ? Colors.orange[300] : Colors.orange[700];
      case 'D':
      case 'د':
        return isDarkMode ? Colors.orange[400] : Colors.orange;
      case 'F':
      case 'هـ':
      case 'W':
      case 'IC':
      case 'WA':
        return isDarkMode ? Colors.red[300] : Colors.red;
      default:
        return null;
    }
  }

  static Color generateColorFromCourse(String input) {
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

  static Color generateBorderColor(Color originalColor) {
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
}
