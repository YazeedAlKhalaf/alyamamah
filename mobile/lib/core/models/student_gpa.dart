import 'dart:convert';

class StudentGPA {
  final String cumGPA;
  final String semesterGPA;

  StudentGPA({
    required this.cumGPA,
    required this.semesterGPA,
  });

  StudentGPA copyWith({
    String? cumGPA,
    String? semesterGPA,
  }) {
    return StudentGPA(
      cumGPA: cumGPA ?? this.cumGPA,
      semesterGPA: semesterGPA ?? this.semesterGPA,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cumGPA': cumGPA,
      'semesterGPA': semesterGPA,
    };
  }

  factory StudentGPA.fromMap(Map<String, dynamic> map) {
    return StudentGPA(
      cumGPA: map['cumGPA'] as String,
      semesterGPA: map['semesterGPA'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentGPA.fromJson(String source) =>
      StudentGPA.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StudentGPA(cumGPA: $cumGPA, semesterGPA: $semesterGPA)';

  @override
  bool operator ==(covariant StudentGPA other) {
    if (identical(this, other)) return true;

    return other.cumGPA == cumGPA && other.semesterGPA == semesterGPA;
  }

  @override
  int get hashCode => cumGPA.hashCode ^ semesterGPA.hashCode;
}
