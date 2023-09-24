import 'dart:convert';

import 'package:alyamamah/core/models/time_table.dart';
import 'package:flutter/foundation.dart';

class OfferedCourse {
  final String courseId;
  final String courseCode;
  final String courseEdition;
  final double creditHours;
  final String courseSection;
  final String courseName;
  final String activityCode;
  final String activityDesc;
  final String campusName;
  final String campusId;
  final String buildingName;
  final String roomCode;
  final String roomDesc;
  final String secDays;
  final String secTimes;
  final String teacherName;
  final String isMain;
  final bool isClosed;
  final List<TimeTable> timeTable;
  final String sectionSeq;
  final String examPeriod;
  final int status;
  final int regError;
  final bool containActivity;
  final bool freeCourse;
  final bool bisect;
  final int categoryCode;
  final int groupSeq;
  final int groupType;
  final String sectionType;
  final String fullWeb;
  final int overlapType;
  final List<OfferedCourse> activityCourses;

  OfferedCourse({
    required this.courseId,
    required this.courseCode,
    required this.courseEdition,
    required this.creditHours,
    required this.courseSection,
    required this.courseName,
    required this.activityCode,
    required this.activityDesc,
    required this.campusName,
    required this.campusId,
    required this.buildingName,
    required this.roomCode,
    required this.roomDesc,
    required this.secDays,
    required this.secTimes,
    required this.teacherName,
    required this.isMain,
    required this.isClosed,
    required this.timeTable,
    required this.sectionSeq,
    required this.examPeriod,
    required this.status,
    required this.regError,
    required this.containActivity,
    required this.freeCourse,
    required this.bisect,
    required this.categoryCode,
    required this.groupSeq,
    required this.groupType,
    required this.sectionType,
    required this.fullWeb,
    required this.overlapType,
    this.activityCourses = const [],
  });

  OfferedCourse copyWith({
    String? courseId,
    String? courseCode,
    String? courseEdition,
    double? creditHours,
    String? courseSection,
    String? courseName,
    String? activityCode,
    String? activityDesc,
    String? campusName,
    String? campusId,
    String? buildingName,
    String? roomCode,
    String? roomDesc,
    String? secDays,
    String? secTimes,
    String? teacherName,
    String? isMain,
    bool? isClosed,
    List<TimeTable>? timeTable,
    String? sectionSeq,
    String? examPeriod,
    int? status,
    int? regError,
    bool? containActivity,
    bool? freeCourse,
    bool? bisect,
    int? categoryCode,
    int? groupSeq,
    int? groupType,
    String? sectionType,
    String? fullWeb,
    int? overlapType,
    List<OfferedCourse>? activityCourses,
  }) {
    return OfferedCourse(
      courseId: courseId ?? this.courseId,
      courseCode: courseCode ?? this.courseCode,
      courseEdition: courseEdition ?? this.courseEdition,
      creditHours: creditHours ?? this.creditHours,
      courseSection: courseSection ?? this.courseSection,
      courseName: courseName ?? this.courseName,
      activityCode: activityCode ?? this.activityCode,
      activityDesc: activityDesc ?? this.activityDesc,
      campusName: campusName ?? this.campusName,
      campusId: campusId ?? this.campusId,
      buildingName: buildingName ?? this.buildingName,
      roomCode: roomCode ?? this.roomCode,
      roomDesc: roomDesc ?? this.roomDesc,
      secDays: secDays ?? this.secDays,
      secTimes: secTimes ?? this.secTimes,
      teacherName: teacherName ?? this.teacherName,
      isMain: isMain ?? this.isMain,
      isClosed: isClosed ?? this.isClosed,
      timeTable: timeTable ?? this.timeTable,
      sectionSeq: sectionSeq ?? this.sectionSeq,
      examPeriod: examPeriod ?? this.examPeriod,
      status: status ?? this.status,
      regError: regError ?? this.regError,
      containActivity: containActivity ?? this.containActivity,
      freeCourse: freeCourse ?? this.freeCourse,
      bisect: bisect ?? this.bisect,
      categoryCode: categoryCode ?? this.categoryCode,
      groupSeq: groupSeq ?? this.groupSeq,
      groupType: groupType ?? this.groupType,
      sectionType: sectionType ?? this.sectionType,
      fullWeb: fullWeb ?? this.fullWeb,
      overlapType: overlapType ?? this.overlapType,
      activityCourses: activityCourses ?? this.activityCourses,
    );
  }

  factory OfferedCourse.fromMap(Map<String, dynamic> map) {
    return OfferedCourse(
      courseId: map['courseId'] as String,
      courseCode: map['courseCode'] as String,
      courseEdition: map['courseEdition'] as String,
      creditHours: map['creditHours'] as double,
      courseSection: map['courseSection'] as String,
      courseName: map['courseName'] as String,
      activityCode: map['activityCode'] as String,
      activityDesc: map['activityDesc'] as String,
      campusName: map['campusName'] as String,
      campusId: map['campusId'] as String,
      buildingName: map['buildingName'] as String,
      roomCode: map['roomCode'] as String,
      roomDesc: map['roomDesc'] as String,
      secDays: map['secDays'] as String,
      secTimes: map['secTimes'] as String,
      teacherName: map['teacherName'] as String,
      isMain: map['isMain'] as String,
      isClosed: map['isClosed'] as bool,
      timeTable: List<TimeTable>.from(
        (map['timeTable'] as List<dynamic>).map<TimeTable>(
          (x) => TimeTable.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sectionSeq: map['sectionSeq'] as String,
      examPeriod: map['examPeriod'] as String,
      status: map['status'] as int,
      regError: map['regError'] as int,
      containActivity: map['containActivity'] as bool,
      freeCourse: map['freeCourse'] as bool,
      bisect: map['bisect'] as bool,
      categoryCode: map['categoryCode'] as int,
      groupSeq: map['groupSeq'] as int,
      groupType: map['groupType'] as int,
      sectionType: map['sectionType'] as String,
      fullWeb: map['fullWeb'] as String,
      overlapType: map['overlapType'] as int,
      activityCourses: [],
    );
  }

  factory OfferedCourse.fromJson(String source) =>
      OfferedCourse.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'courseCode': courseCode,
      'courseEdition': courseEdition,
      'creditHours': creditHours,
      'courseSection': courseSection,
      'courseName': courseName,
      'activityCode': activityCode,
      'activityDesc': activityDesc,
      'campusName': campusName,
      'campusId': campusId,
      'buildingName': buildingName,
      'roomCode': roomCode,
      'roomDesc': roomDesc,
      'secDays': secDays,
      'secTimes': secTimes,
      'teacherName': teacherName,
      'isMain': isMain,
      'isClosed': isClosed,
      'timeTable': timeTable.map((x) => x.toMap()).toList(),
      'sectionSeq': sectionSeq,
      'examPeriod': examPeriod,
      'status': status,
      'regError': regError,
      'containActivity': containActivity,
      'freeCourse': freeCourse,
      'bisect': bisect,
      'categoryCode': categoryCode,
      'groupSeq': groupSeq,
      'groupType': groupType,
      'sectionType': sectionType,
      'fullWeb': fullWeb,
      'overlapType': overlapType,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'OfferedCourse(courseId: $courseId, courseCode: $courseCode, courseEdition: $courseEdition, creditHours: $creditHours, courseSection: $courseSection, courseName: $courseName, activityCode: $activityCode, activityDesc: $activityDesc, campusName: $campusName, campusId: $campusId, buildingName: $buildingName, roomCode: $roomCode, roomDesc: $roomDesc, secDays: $secDays, secTimes: $secTimes, teacherName: $teacherName, isMain: $isMain, isClosed: $isClosed, timeTable: $timeTable, sectionSeq: $sectionSeq, examPeriod: $examPeriod, status: $status, regError: $regError, containActivity: $containActivity, freeCourse: $freeCourse, bisect: $bisect, categoryCode: $categoryCode, groupSeq: $groupSeq, groupType: $groupType, sectionType: $sectionType, fullWeb: $fullWeb, overlapType: $overlapType, activityCourses: $activityCourses)';
  }

  @override
  bool operator ==(covariant OfferedCourse other) {
    if (identical(this, other)) return true;

    return other.courseId == courseId &&
        other.courseCode == courseCode &&
        other.courseEdition == courseEdition &&
        other.creditHours == creditHours &&
        other.courseSection == courseSection &&
        other.courseName == courseName &&
        other.activityCode == activityCode &&
        other.activityDesc == activityDesc &&
        other.campusName == campusName &&
        other.campusId == campusId &&
        other.buildingName == buildingName &&
        other.roomCode == roomCode &&
        other.roomDesc == roomDesc &&
        other.secDays == secDays &&
        other.secTimes == secTimes &&
        other.teacherName == teacherName &&
        other.isMain == isMain &&
        other.isClosed == isClosed &&
        listEquals(other.timeTable, timeTable) &&
        other.sectionSeq == sectionSeq &&
        other.examPeriod == examPeriod &&
        other.status == status &&
        other.regError == regError &&
        other.containActivity == containActivity &&
        other.freeCourse == freeCourse &&
        other.bisect == bisect &&
        other.categoryCode == categoryCode &&
        other.groupSeq == groupSeq &&
        other.groupType == groupType &&
        other.sectionType == sectionType &&
        other.fullWeb == fullWeb &&
        other.overlapType == overlapType &&
        listEquals(other.activityCourses, activityCourses);
  }

  @override
  int get hashCode {
    return courseId.hashCode ^
        courseCode.hashCode ^
        courseEdition.hashCode ^
        creditHours.hashCode ^
        courseSection.hashCode ^
        courseName.hashCode ^
        activityCode.hashCode ^
        activityDesc.hashCode ^
        campusName.hashCode ^
        campusId.hashCode ^
        buildingName.hashCode ^
        roomCode.hashCode ^
        roomDesc.hashCode ^
        secDays.hashCode ^
        secTimes.hashCode ^
        teacherName.hashCode ^
        isMain.hashCode ^
        isClosed.hashCode ^
        timeTable.hashCode ^
        sectionSeq.hashCode ^
        examPeriod.hashCode ^
        status.hashCode ^
        regError.hashCode ^
        containActivity.hashCode ^
        freeCourse.hashCode ^
        bisect.hashCode ^
        categoryCode.hashCode ^
        groupSeq.hashCode ^
        groupType.hashCode ^
        sectionType.hashCode ^
        fullWeb.hashCode ^
        overlapType.hashCode ^
        activityCourses.hashCode;
  }
}
