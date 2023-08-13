class LoginResponse {
  final String accessToken;

  LoginResponse({
    required this.accessToken,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      accessToken: map['accessToken'],
    );
  }

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken;
  }

  @override
  int get hashCode => accessToken.hashCode;

  @override
  String toString() => 'LoginResponse(accessToken: $accessToken)';
}
