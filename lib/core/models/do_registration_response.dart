import 'dart:convert';

class DoRegistrationResponse {
  final String itemDesc;
  final String itemValue;

  DoRegistrationResponse({
    required this.itemDesc,
    required this.itemValue,
  });

  DoRegistrationResponse copyWith({
    String? itemDesc,
    String? itemValue,
  }) {
    return DoRegistrationResponse(
      itemDesc: itemDesc ?? this.itemDesc,
      itemValue: itemValue ?? this.itemValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemDesc': itemDesc,
      'itemValue': itemValue,
    };
  }

  factory DoRegistrationResponse.fromMap(Map<String, dynamic> map) {
    return DoRegistrationResponse(
      itemDesc: map['itemDesc'] as String,
      itemValue: map['itemValue'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoRegistrationResponse.fromJson(String source) =>
      DoRegistrationResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DoRegistrationResponse(itemDesc: $itemDesc, itemValue: $itemValue)';

  @override
  bool operator ==(covariant DoRegistrationResponse other) {
    if (identical(this, other)) return true;

    return other.itemDesc == itemDesc && other.itemValue == itemValue;
  }

  @override
  int get hashCode => itemDesc.hashCode ^ itemValue.hashCode;
}
