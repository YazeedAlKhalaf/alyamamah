import 'dart:convert';

import 'package:alyamamah/core/models/absence_details.dart';
import 'package:flutter/foundation.dart';

class Absence {
  final List<AbsenceDetails> details;
  final String activity;
  final String campus;
  final String countAbsence;
  final String countLate;
  final String courseCode;
  final String courseName;
  final String courseNo;
  final String date;
  final String day;
  final String index;
  final bool isExcused;
  final bool late;
  final String section;
  final String sectionSeq;
  final String time;
  final String totalAbsencePercent;
  final String warningLevel;
  final String warningPercent;
  final String weekNo;

  Absence({
    required this.details,
    required this.activity,
    required this.campus,
    required this.countAbsence,
    required this.countLate,
    required this.courseCode,
    required this.courseName,
    required this.courseNo,
    required this.date,
    required this.day,
    required this.index,
    required this.isExcused,
    required this.late,
    required this.section,
    required this.sectionSeq,
    required this.time,
    required this.totalAbsencePercent,
    required this.warningLevel,
    required this.warningPercent,
    required this.weekNo,
  });

  Absence copyWith({
    List<AbsenceDetails>? details,
    String? activity,
    String? campus,
    String? countAbsence,
    String? countLate,
    String? courseCode,
    String? courseName,
    String? courseNo,
    String? date,
    String? day,
    String? index,
    bool? isExcused,
    bool? late,
    String? section,
    String? sectionSeq,
    String? time,
    String? totalAbsencePercent,
    String? warningLevel,
    String? warningPercent,
    String? weekNo,
  }) {
    return Absence(
      details: details ?? this.details,
      activity: activity ?? this.activity,
      campus: campus ?? this.campus,
      countAbsence: countAbsence ?? this.countAbsence,
      countLate: countLate ?? this.countLate,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      courseNo: courseNo ?? this.courseNo,
      date: date ?? this.date,
      day: day ?? this.day,
      index: index ?? this.index,
      isExcused: isExcused ?? this.isExcused,
      late: late ?? this.late,
      section: section ?? this.section,
      sectionSeq: sectionSeq ?? this.sectionSeq,
      time: time ?? this.time,
      totalAbsencePercent: totalAbsencePercent ?? this.totalAbsencePercent,
      warningLevel: warningLevel ?? this.warningLevel,
      warningPercent: warningPercent ?? this.warningPercent,
      weekNo: weekNo ?? this.weekNo,
    );
  }

  factory Absence.fromMap(Map<String, dynamic> map) {
    return Absence(
      details: List<AbsenceDetails>.from(
        (map['absenceDetails'] as List<dynamic>).map<AbsenceDetails>(
          (x) => AbsenceDetails.fromMap(x as Map<String, dynamic>),
        ),
      ),
      activity: map['activity'] as String,
      campus: map['campus'] as String,
      countAbsence: map['countAbsence'] as String,
      countLate: map['countLate'] as String,
      courseCode: map['courseCode'] as String,
      courseName: map['courseName'] as String,
      courseNo: map['courseNo'] as String,
      date: map['date'] as String,
      day: map['day'] as String,
      index: map['index'] as String,
      isExcused: map['isExcused'] as bool,
      late: map['late'] as bool,
      section: map['section'] as String,
      sectionSeq: map['sectionSeq'] as String,
      time: map['time'] as String,
      totalAbsencePercent: map['totalAbsencePercent'] as String,
      warningLevel: map['warningLevel'] as String,
      warningPercent: map['warningPercent'] as String,
      weekNo: map['weekNo'] as String,
    );
  }

  factory Absence.fromJson(String source) =>
      Absence.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'absenceDetails': details.map((x) => x.toMap()).toList(),
      'activity': activity,
      'campus': campus,
      'countAbsence': countAbsence,
      'countLate': countLate,
      'courseCode': courseCode,
      'courseName': courseName,
      'courseNo': courseNo,
      'date': date,
      'day': day,
      'index': index,
      'isExcused': isExcused,
      'late': late,
      'section': section,
      'sectionSeq': sectionSeq,
      'time': time,
      'totalAbsencePercent': totalAbsencePercent,
      'warningLevel': warningLevel,
      'warningPercent': warningPercent,
      'weekNo': weekNo,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Absence(details: $details, activity: $activity, campus: $campus, countAbsence: $countAbsence, countLate: $countLate, courseCode: $courseCode, courseName: $courseName, courseNo: $courseNo, date: $date, day: $day, index: $index, isExcused: $isExcused, late: $late, section: $section, sectionSeq: $sectionSeq, time: $time, totalAbsencePercent: $totalAbsencePercent, warningLevel: $warningLevel, warningPercent: $warningPercent, weekNo: $weekNo)';
  }

  @override
  bool operator ==(covariant Absence other) {
    if (identical(this, other)) return true;

    return listEquals(other.details, details) &&
        other.activity == activity &&
        other.campus == campus &&
        other.countAbsence == countAbsence &&
        other.countLate == countLate &&
        other.courseCode == courseCode &&
        other.courseName == courseName &&
        other.courseNo == courseNo &&
        other.date == date &&
        other.day == day &&
        other.index == index &&
        other.isExcused == isExcused &&
        other.late == late &&
        other.section == section &&
        other.sectionSeq == sectionSeq &&
        other.time == time &&
        other.totalAbsencePercent == totalAbsencePercent &&
        other.warningLevel == warningLevel &&
        other.warningPercent == warningPercent &&
        other.weekNo == weekNo;
  }

  @override
  int get hashCode {
    return details.hashCode ^
        activity.hashCode ^
        campus.hashCode ^
        countAbsence.hashCode ^
        countLate.hashCode ^
        courseCode.hashCode ^
        courseName.hashCode ^
        courseNo.hashCode ^
        date.hashCode ^
        day.hashCode ^
        index.hashCode ^
        isExcused.hashCode ^
        late.hashCode ^
        section.hashCode ^
        sectionSeq.hashCode ^
        time.hashCode ^
        totalAbsencePercent.hashCode ^
        warningLevel.hashCode ^
        warningPercent.hashCode ^
        weekNo.hashCode;
  }
}
