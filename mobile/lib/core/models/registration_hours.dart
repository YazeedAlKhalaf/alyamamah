import 'dart:convert';

class RegistrationHours {
  final double maxHrs;
  final double minHrs;
  final double attemptedHrs;

  RegistrationHours({
    required this.maxHrs,
    required this.minHrs,
    required this.attemptedHrs,
  });

  RegistrationHours copyWith({
    double? maxHrs,
    double? minHrs,
    double? attemptedHrs,
  }) {
    return RegistrationHours(
      maxHrs: maxHrs ?? this.maxHrs,
      minHrs: minHrs ?? this.minHrs,
      attemptedHrs: attemptedHrs ?? this.attemptedHrs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maxHrs': maxHrs,
      'minHrs': minHrs,
      'attemptedHrs': attemptedHrs,
    };
  }

  factory RegistrationHours.fromMap(Map<String, dynamic> map) {
    return RegistrationHours(
      maxHrs: map['maxHrs'] as double,
      minHrs: map['minHrs'] as double,
      attemptedHrs: map['attemptedHrs'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationHours.fromJson(String source) =>
      RegistrationHours.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RegistrationHours(maxHrs: $maxHrs, minHrs: $minHrs, attemptedHrs: $attemptedHrs)';

  @override
  bool operator ==(covariant RegistrationHours other) {
    if (identical(this, other)) return true;

    return other.maxHrs == maxHrs &&
        other.minHrs == minHrs &&
        other.attemptedHrs == attemptedHrs;
  }

  @override
  int get hashCode => maxHrs.hashCode ^ minHrs.hashCode ^ attemptedHrs.hashCode;
}
