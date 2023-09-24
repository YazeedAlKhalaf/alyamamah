import 'dart:convert';

class Semester {
  final String currentSemester;
  final String currentSemesterDesc;
  final String markSemester;
  final String markSemesterDesc;
  final String prevSemester;
  final String prevSemesterDesc;
  final String regSemester;
  final String regSemesterDesc;
  final String yearSemester;
  final String yearSemesterDesc;

  const Semester({
    required this.currentSemester,
    required this.currentSemesterDesc,
    required this.markSemester,
    required this.markSemesterDesc,
    required this.prevSemester,
    required this.prevSemesterDesc,
    required this.regSemester,
    required this.regSemesterDesc,
    required this.yearSemester,
    required this.yearSemesterDesc,
  });

  Semester copyWith({
    String? currentSemester,
    String? currentSemesterDesc,
    String? markSemester,
    String? markSemesterDesc,
    String? prevSemester,
    String? prevSemesterDesc,
    String? regSemester,
    String? regSemesterDesc,
    String? yearSemester,
    String? yearSemesterDesc,
  }) {
    return Semester(
      currentSemester: currentSemester ?? this.currentSemester,
      currentSemesterDesc: currentSemesterDesc ?? this.currentSemesterDesc,
      markSemester: markSemester ?? this.markSemester,
      markSemesterDesc: markSemesterDesc ?? this.markSemesterDesc,
      prevSemester: prevSemester ?? this.prevSemester,
      prevSemesterDesc: prevSemesterDesc ?? this.prevSemesterDesc,
      regSemester: regSemester ?? this.regSemester,
      regSemesterDesc: regSemesterDesc ?? this.regSemesterDesc,
      yearSemester: yearSemester ?? this.yearSemester,
      yearSemesterDesc: yearSemesterDesc ?? this.yearSemesterDesc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentSemester': currentSemester,
      'currentSemesterDesc': currentSemesterDesc,
      'markSemester': markSemester,
      'markSemesterDesc': markSemesterDesc,
      'prevSemester': prevSemester,
      'prevSemesterDesc': prevSemesterDesc,
      'regSemester': regSemester,
      'regSemesterDesc': regSemesterDesc,
      'yearSemester': yearSemester,
      'yearSemesterDesc': yearSemesterDesc,
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      currentSemester: map['currentSemester'] as String,
      currentSemesterDesc: map['currentSemesterDesc'] as String,
      markSemester: map['markSemester'] as String,
      markSemesterDesc: map['markSemesterDesc'] as String,
      prevSemester: map['prevSemester'] as String,
      prevSemesterDesc: map['prevSemesterDesc'] as String,
      regSemester: map['regSemester'] as String,
      regSemesterDesc: map['regSemesterDesc'] as String,
      yearSemester: map['yearSemester'] as String,
      yearSemesterDesc: map['yearSemesterDesc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(String source) =>
      Semester.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Semester(currentSemester: $currentSemester, currentSemesterDesc: $currentSemesterDesc, markSemester: $markSemester, markSemesterDesc: $markSemesterDesc, prevSemester: $prevSemester, prevSemesterDesc: $prevSemesterDesc, regSemester: $regSemester, regSemesterDesc: $regSemesterDesc, yearSemester: $yearSemester, yearSemesterDesc: $yearSemesterDesc)';
  }

  @override
  bool operator ==(covariant Semester other) {
    if (identical(this, other)) return true;

    return other.currentSemester == currentSemester &&
        other.currentSemesterDesc == currentSemesterDesc &&
        other.markSemester == markSemester &&
        other.markSemesterDesc == markSemesterDesc &&
        other.prevSemester == prevSemester &&
        other.prevSemesterDesc == prevSemesterDesc &&
        other.regSemester == regSemester &&
        other.regSemesterDesc == regSemesterDesc &&
        other.yearSemester == yearSemester &&
        other.yearSemesterDesc == yearSemesterDesc;
  }

  @override
  int get hashCode {
    return currentSemester.hashCode ^
        currentSemesterDesc.hashCode ^
        markSemester.hashCode ^
        markSemesterDesc.hashCode ^
        prevSemester.hashCode ^
        prevSemesterDesc.hashCode ^
        regSemester.hashCode ^
        regSemesterDesc.hashCode ^
        yearSemester.hashCode ^
        yearSemesterDesc.hashCode;
  }
}
