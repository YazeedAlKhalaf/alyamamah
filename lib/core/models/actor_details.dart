import 'dart:convert';

import 'package:alyamamah/core/models/common_info.dart';
import 'package:alyamamah/core/models/semester.dart';
import 'package:alyamamah/core/models/service.dart';
import 'package:alyamamah/core/models/session_info.dart';
import 'package:flutter/foundation.dart';

class ActorDetails {
  final CommonInfo commonInfo;
  final Semester semester;
  final List<Service> services;
  final SessionInfo sessionInfo;
  final String privacyUrl;
  final String supportUrl;

  const ActorDetails({
    required this.commonInfo,
    required this.semester,
    required this.services,
    required this.sessionInfo,
    required this.privacyUrl,
    required this.supportUrl,
  });

  ActorDetails copyWith({
    CommonInfo? commonInfo,
    Semester? semester,
    List<Service>? services,
    SessionInfo? sessionInfo,
    String? privacyUrl,
    String? supportUrl,
  }) {
    return ActorDetails(
      commonInfo: commonInfo ?? this.commonInfo,
      semester: semester ?? this.semester,
      services: services ?? this.services,
      sessionInfo: sessionInfo ?? this.sessionInfo,
      privacyUrl: privacyUrl ?? this.privacyUrl,
      supportUrl: supportUrl ?? this.supportUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commonInfo': commonInfo.toMap(),
      'semester': semester.toMap(),
      'services': services.map((x) => x.toMap()).toList(),
      'sessionInfo': sessionInfo.toMap(),
      'privacyUrl': privacyUrl,
      'supportUrl': supportUrl,
    };
  }

  factory ActorDetails.fromMap(Map<String, dynamic> map) {
    return ActorDetails(
      commonInfo: CommonInfo.fromMap(map['commonInfo'] as Map<String, dynamic>),
      semester: Semester.fromMap(map['semester'] as Map<String, dynamic>),
      services: List<Service>.from(
        (map['services'] as List<dynamic>).map<Service>(
          (x) => Service.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sessionInfo:
          SessionInfo.fromMap(map['sessionInfo'] as Map<String, dynamic>),
      privacyUrl: map['privacyUrl'] as String,
      supportUrl: map['supportUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActorDetails.fromJson(String source) =>
      ActorDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActorDetails(commonInfo: $commonInfo, semester: $semester, services: $services, sessionInfo: $sessionInfo, privacyUrl: $privacyUrl, supportUrl: $supportUrl)';
  }

  @override
  bool operator ==(covariant ActorDetails other) {
    if (identical(this, other)) return true;

    return other.commonInfo == commonInfo &&
        other.semester == semester &&
        listEquals(other.services, services) &&
        other.sessionInfo == sessionInfo &&
        other.privacyUrl == privacyUrl &&
        other.supportUrl == supportUrl;
  }

  @override
  int get hashCode {
    return commonInfo.hashCode ^
        semester.hashCode ^
        services.hashCode ^
        sessionInfo.hashCode ^
        privacyUrl.hashCode ^
        supportUrl.hashCode;
  }
}
