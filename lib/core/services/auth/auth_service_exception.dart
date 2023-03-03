enum AuthServiceExceptionType {
  unknown,
  invalidCredentials,
  sessionExpired,
}

class AuthServiceException implements Exception {
  final AuthServiceExceptionType type;

  const AuthServiceException([this.type = AuthServiceExceptionType.unknown]);
}
