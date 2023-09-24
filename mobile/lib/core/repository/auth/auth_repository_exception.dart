enum AuthRepositoryExceptionType {
  unknown,
  invalidCredentials,
}

class AuthRepositoryException implements Exception {
  final AuthRepositoryExceptionType type;

  AuthRepositoryException([this.type = AuthRepositoryExceptionType.unknown]);

  @override
  String toString() => 'AuthRepositoryException(type: $type)';
}
