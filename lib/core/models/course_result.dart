import 'dart:convert';

class CourseResult {
  final String activityDesc;
  final String confirmedMark;
  final String courseCode;
  final String courseName;
  final String courseNo;
  final String creditHours;
  final String gradeDesc;
  final String sumation;

  CourseResult({
    required this.activityDesc,
    required this.confirmedMark,
    required this.courseCode,
    required this.courseName,
    required this.courseNo,
    required this.creditHours,
    required this.gradeDesc,
    required this.sumation,
  });

  CourseResult copyWith({
    String? activityDesc,
    String? confirmedMark,
    String? courseCode,
    String? courseName,
    String? courseNo,
    String? creditHours,
    String? gradeDesc,
    String? sumation,
  }) {
    return CourseResult(
      activityDesc: activityDesc ?? this.activityDesc,
      confirmedMark: confirmedMark ?? this.confirmedMark,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      courseNo: courseNo ?? this.courseNo,
      creditHours: creditHours ?? this.creditHours,
      gradeDesc: gradeDesc ?? this.gradeDesc,
      sumation: sumation ?? this.sumation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activityDesc': activityDesc,
      'confirmedMark': confirmedMark,
      'courseCode': courseCode,
      'courseName': courseName,
      'courseNo': courseNo,
      'creditHours': creditHours,
      'gradeDesc': gradeDesc,
      'sumation': sumation,
    };
  }

  factory CourseResult.fromMap(Map<String, dynamic> map) {
    return CourseResult(
      activityDesc: map['activityDesc'] as String,
      confirmedMark: map['confirmedMark'] as String,
      courseCode: map['courseCode'] as String,
      courseName: map['courseName'] as String,
      courseNo: map['courseNo'] as String,
      creditHours: map['creditHours'] as String,
      gradeDesc: map['gradeDesc'] as String,
      sumation: map['sumation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseResult.fromJson(String source) =>
      CourseResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseResult(activityDesc: $activityDesc, confirmedMark: $confirmedMark, courseCode: $courseCode, courseName: $courseName, courseNo: $courseNo, creditHours: $creditHours, gradeDesc: $gradeDesc, sumation: $sumation)';
  }

  @override
  bool operator ==(covariant CourseResult other) {
    if (identical(this, other)) return true;

    return other.activityDesc == activityDesc &&
        other.confirmedMark == confirmedMark &&
        other.courseCode == courseCode &&
        other.courseName == courseName &&
        other.courseNo == courseNo &&
        other.creditHours == creditHours &&
        other.gradeDesc == gradeDesc &&
        other.sumation == sumation;
  }

  @override
  int get hashCode {
    return activityDesc.hashCode ^
        confirmedMark.hashCode ^
        courseCode.hashCode ^
        courseName.hashCode ^
        courseNo.hashCode ^
        creditHours.hashCode ^
        gradeDesc.hashCode ^
        sumation.hashCode;
  }
}
