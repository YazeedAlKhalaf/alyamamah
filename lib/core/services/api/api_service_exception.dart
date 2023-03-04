enum ApiServiceExceptionType {
  unknown,
  invalidCredentials,
  sessionExpired,
}

class ApiServiceException implements Exception {
  final ApiServiceExceptionType type;

  const ApiServiceException([this.type = ApiServiceExceptionType.unknown]);
}
