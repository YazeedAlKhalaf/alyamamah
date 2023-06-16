import 'package:alyamamah/core/extensions/build_context.dart';
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
}
