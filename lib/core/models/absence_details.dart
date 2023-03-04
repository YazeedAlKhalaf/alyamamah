import 'dart:convert';

class AbsenceDetails {
  final String activity;
  final String date;
  final String dateH;
  final String day;
  final bool isExcused;
  final bool late;
  final String section;
  final String time;
  final String weekNo;

  AbsenceDetails({
    required this.activity,
    required this.date,
    required this.dateH,
    required this.day,
    required this.isExcused,
    required this.late,
    required this.section,
    required this.time,
    required this.weekNo,
  });

  AbsenceDetails copyWith({
    String? activity,
    String? date,
    String? dateH,
    String? day,
    bool? isExcused,
    bool? late,
    String? section,
    String? time,
    String? weekNo,
  }) {
    return AbsenceDetails(
      activity: activity ?? this.activity,
      date: date ?? this.date,
      dateH: dateH ?? this.dateH,
      day: day ?? this.day,
      isExcused: isExcused ?? this.isExcused,
      late: late ?? this.late,
      section: section ?? this.section,
      time: time ?? this.time,
      weekNo: weekNo ?? this.weekNo,
    );
  }

  factory AbsenceDetails.fromMap(Map<String, dynamic> map) {
    return AbsenceDetails(
      activity: map['activity'] as String,
      date: map['date'] as String,
      dateH: map['dateH'] as String,
      day: map['day'] as String,
      isExcused: map['isExcused'] as bool,
      late: map['late'] as bool,
      section: map['section'] as String,
      time: map['time'] as String,
      weekNo: map['weekNo'] as String,
    );
  }

  factory AbsenceDetails.fromJson(String source) =>
      AbsenceDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AbsenceDetails(activity: $activity, date: $date, dateH: $dateH, day: $day, isExcused: $isExcused, late: $late, section: $section, time: $time, weekNo: $weekNo)';
  }

  @override
  bool operator ==(covariant AbsenceDetails other) {
    if (identical(this, other)) return true;

    return other.activity == activity &&
        other.date == date &&
        other.dateH == dateH &&
        other.day == day &&
        other.isExcused == isExcused &&
        other.late == late &&
        other.section == section &&
        other.time == time &&
        other.weekNo == weekNo;
  }

  @override
  int get hashCode {
    return activity.hashCode ^
        date.hashCode ^
        dateH.hashCode ^
        day.hashCode ^
        isExcused.hashCode ^
        late.hashCode ^
        section.hashCode ^
        time.hashCode ^
        weekNo.hashCode;
  }
}
