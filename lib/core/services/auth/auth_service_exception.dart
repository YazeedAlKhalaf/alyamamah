enum AuthServiceExceptionType {
  unknown,
  invalidCredentials,
}

class AuthServiceException implements Exception {
  final AuthServiceExceptionType type;

  const AuthServiceException([this.type = AuthServiceExceptionType.unknown]);
}
