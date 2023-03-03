import 'dart:convert';

import 'package:alyamamah/core/models/time_table.dart';
import 'package:flutter/foundation.dart';

class Schedule {
  final String activityCode;
  final String activityDesc;
  final String campusName;
  final String campusNo;
  final String courseCode;
  final bool courseDeleted;
  final String courseEdition;
  final String courseName;
  final String courseNo;
  final String courseStatus;
  final String crdHrs;
  final String degreeCode;
  final String entryDate;
  final String gender;
  final String instructor;
  final String isMain;
  final String loadHrs;
  final String section;
  final String sectionSeq;
  final bool showActivity;
  final String tableIndex;
  final String time;
  final String timeSection;
  final List<TimeTable> timeTable;

  const Schedule({
    required this.activityCode,
    required this.activityDesc,
    required this.campusName,
    required this.campusNo,
    required this.courseCode,
    required this.courseDeleted,
    required this.courseEdition,
    required this.courseName,
    required this.courseNo,
    required this.courseStatus,
    required this.crdHrs,
    required this.degreeCode,
    required this.entryDate,
    required this.gender,
    required this.instructor,
    required this.isMain,
    required this.loadHrs,
    required this.section,
    required this.sectionSeq,
    required this.showActivity,
    required this.tableIndex,
    required this.time,
    required this.timeSection,
    required this.timeTable,
  });

  Schedule copyWith({
    String? activityCode,
    String? activityDesc,
    String? campusName,
    String? campusNo,
    String? courseCode,
    bool? courseDeleted,
    String? courseEdition,
    String? courseName,
    String? courseNo,
    String? courseStatus,
    String? crdHrs,
    String? degreeCode,
    String? entryDate,
    String? gender,
    String? instructor,
    String? isMain,
    String? loadHrs,
    String? section,
    String? sectionSeq,
    bool? showActivity,
    String? tableIndex,
    String? time,
    String? timeSection,
    List<TimeTable>? timeTable,
  }) {
    return Schedule(
      activityCode: activityCode ?? this.activityCode,
      activityDesc: activityDesc ?? this.activityDesc,
      campusName: campusName ?? this.campusName,
      campusNo: campusNo ?? this.campusNo,
      courseCode: courseCode ?? this.courseCode,
      courseDeleted: courseDeleted ?? this.courseDeleted,
      courseEdition: courseEdition ?? this.courseEdition,
      courseName: courseName ?? this.courseName,
      courseNo: courseNo ?? this.courseNo,
      courseStatus: courseStatus ?? this.courseStatus,
      crdHrs: crdHrs ?? this.crdHrs,
      degreeCode: degreeCode ?? this.degreeCode,
      entryDate: entryDate ?? this.entryDate,
      gender: gender ?? this.gender,
      instructor: instructor ?? this.instructor,
      isMain: isMain ?? this.isMain,
      loadHrs: loadHrs ?? this.loadHrs,
      section: section ?? this.section,
      sectionSeq: sectionSeq ?? this.sectionSeq,
      showActivity: showActivity ?? this.showActivity,
      tableIndex: tableIndex ?? this.tableIndex,
      time: time ?? this.time,
      timeSection: timeSection ?? this.timeSection,
      timeTable: timeTable ?? this.timeTable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activityCode': activityCode,
      'activityDesc': activityDesc,
      'campusName': campusName,
      'campusNo': campusNo,
      'courseCode': courseCode,
      'courseDeleted': courseDeleted,
      'courseEdition': courseEdition,
      'courseName': courseName,
      'courseNo': courseNo,
      'courseStatus': courseStatus,
      'crdHrs': crdHrs,
      'degreeCode': degreeCode,
      'entryDate': entryDate,
      'gender': gender,
      'instructor': instructor,
      'isMain': isMain,
      'loadHrs': loadHrs,
      'section': section,
      'sectionSeq': sectionSeq,
      'showActivity': showActivity,
      'tableIndex': tableIndex,
      'time': time,
      'timeSection': timeSection,
      'timeTable': timeTable.toString(),
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      activityCode: map['activityCode'] as String,
      activityDesc: map['activityDesc'] as String,
      campusName: map['campusName'] as String,
      campusNo: map['campusNo'] as String,
      courseCode: map['courseCode'] as String,
      courseDeleted: map['courseDeleted'] as bool,
      courseEdition: map['courseEdition'] as String,
      courseName: map['courseName'] as String,
      courseNo: map['courseNo'] as String,
      courseStatus: map['courseStatus'] as String,
      crdHrs: map['crdHrs'] as String,
      degreeCode: map['degreeCode'] as String,
      entryDate: map['entryDate'] as String,
      gender: map['gender'] as String,
      instructor: map['instructor'] as String,
      isMain: map['isMain'] as String,
      loadHrs: map['loadHrs'] as String,
      section: map['section'] as String,
      sectionSeq: map['sectionSeq'] as String,
      showActivity: map['showActivity'] as bool,
      tableIndex: map['tableIndex'] as String,
      time: map['time'] as String,
      timeSection: map['timeSection'] as String,
      timeTable: List<TimeTable>.from(
        (map['timeTable'] as List<dynamic>).map<TimeTable>(
          (x) => TimeTable.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Schedule(activityCode: $activityCode, activityDesc: $activityDesc, campusName: $campusName, campusNo: $campusNo, courseCode: $courseCode, courseDeleted: $courseDeleted, courseEdition: $courseEdition, courseName: $courseName, courseNo: $courseNo, courseStatus: $courseStatus, crdHrs: $crdHrs, degreeCode: $degreeCode, entryDate: $entryDate, gender: $gender, instructor: $instructor, isMain: $isMain, loadHrs: $loadHrs, section: $section, sectionSeq: $sectionSeq, showActivity: $showActivity, tableIndex: $tableIndex, time: $time, timeSection: $timeSection, timeTable: $timeTable)';
  }

  @override
  bool operator ==(covariant Schedule other) {
    if (identical(this, other)) return true;

    return other.activityCode == activityCode &&
        other.activityDesc == activityDesc &&
        other.campusName == campusName &&
        other.campusNo == campusNo &&
        other.courseCode == courseCode &&
        other.courseDeleted == courseDeleted &&
        other.courseEdition == courseEdition &&
        other.courseName == courseName &&
        other.courseNo == courseNo &&
        other.courseStatus == courseStatus &&
        other.crdHrs == crdHrs &&
        other.degreeCode == degreeCode &&
        other.entryDate == entryDate &&
        other.gender == gender &&
        other.instructor == instructor &&
        other.isMain == isMain &&
        other.loadHrs == loadHrs &&
        other.section == section &&
        other.sectionSeq == sectionSeq &&
        other.showActivity == showActivity &&
        other.tableIndex == tableIndex &&
        other.time == time &&
        other.timeSection == timeSection &&
        listEquals(other.timeTable, timeTable);
  }

  @override
  int get hashCode {
    return activityCode.hashCode ^
        activityDesc.hashCode ^
        campusName.hashCode ^
        campusNo.hashCode ^
        courseCode.hashCode ^
        courseDeleted.hashCode ^
        courseEdition.hashCode ^
        courseName.hashCode ^
        courseNo.hashCode ^
        courseStatus.hashCode ^
        crdHrs.hashCode ^
        degreeCode.hashCode ^
        entryDate.hashCode ^
        gender.hashCode ^
        instructor.hashCode ^
        isMain.hashCode ^
        loadHrs.hashCode ^
        section.hashCode ^
        sectionSeq.hashCode ^
        showActivity.hashCode ^
        tableIndex.hashCode ^
        time.hashCode ^
        timeSection.hashCode ^
        timeTable.hashCode;
  }
}
