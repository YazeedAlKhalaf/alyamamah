class LoginResponse {
  final String accessToken;
  final String connectyCubeToken;

  LoginResponse({
    required this.accessToken,
    required this.connectyCubeToken,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      accessToken: map['accessToken'],
      connectyCubeToken: map['connectyCubeToken'],
    );
  }

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.connectyCubeToken == connectyCubeToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ connectyCubeToken.hashCode;

  @override
  String toString() =>
      'LoginResponse(accessToken: $accessToken, connectyCubeToken: $connectyCubeToken)';
}
