import 'dart:convert';

class Service {
  final String serviceId;
  final bool enabled;

  const Service({
    required this.serviceId,
    required this.enabled,
  });

  Service copyWith({
    String? serviceId,
    bool? enabled,
  }) {
    return Service(
      serviceId: serviceId ?? this.serviceId,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceId': serviceId,
      'enabled': enabled ? '1' : '0',
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      serviceId: map['serviceId'] as String,
      enabled: map['enabled'] == '1',
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Service(serviceId: $serviceId, enabled: $enabled)';

  @override
  bool operator ==(covariant Service other) {
    if (identical(this, other)) return true;

    return other.serviceId == serviceId && other.enabled == enabled;
  }

  @override
  int get hashCode => serviceId.hashCode ^ enabled.hashCode;
}
