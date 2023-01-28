import 'dart:convert';

class CommonInfo {
  final String actorImage;
  final String actorType;
  final String latestVersion;
  final String msg;
  final bool status;
  final String userId;

  const CommonInfo({
    required this.actorImage,
    required this.actorType,
    required this.latestVersion,
    required this.msg,
    required this.status,
    required this.userId,
  });

  CommonInfo copyWith({
    String? actorImage,
    String? actorType,
    String? latestVersion,
    String? msg,
    bool? status,
    String? userId,
  }) {
    return CommonInfo(
      actorImage: actorImage ?? this.actorImage,
      actorType: actorType ?? this.actorType,
      latestVersion: latestVersion ?? this.latestVersion,
      msg: msg ?? this.msg,
      status: status ?? this.status,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'actorImage': actorImage,
      'actorType': actorType,
      'latestVersion': latestVersion,
      'msg': msg,
      'status': status,
      'userId': userId,
    };
  }

  factory CommonInfo.fromMap(Map<String, dynamic> map) {
    return CommonInfo(
      actorImage: map['actorImage'] as String,
      actorType: map['actorType'] as String,
      latestVersion: map['latestVersion'] as String,
      msg: map['msg'] as String,
      status: map['status'] as bool,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommonInfo.fromJson(String source) =>
      CommonInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommonInfo(actorImage: $actorImage, actorType: $actorType, latestVersion: $latestVersion, msg: $msg, status: $status, userId: $userId)';
  }

  @override
  bool operator ==(covariant CommonInfo other) {
    if (identical(this, other)) return true;

    return other.actorImage == actorImage &&
        other.actorType == actorType &&
        other.latestVersion == latestVersion &&
        other.msg == msg &&
        other.status == status &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return actorImage.hashCode ^
        actorType.hashCode ^
        latestVersion.hashCode ^
        msg.hashCode ^
        status.hashCode ^
        userId.hashCode;
  }
}
