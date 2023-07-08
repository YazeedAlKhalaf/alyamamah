enum ApiServiceExceptionType {
  unknown,
  invalidCredentials,
  sessionExpired,
  noStudentGpaReturned,
}

class ApiServiceException implements Exception {
  final ApiServiceExceptionType type;

  const ApiServiceException([this.type = ApiServiceExceptionType.unknown]);

  @override
  String toString() => 'ApiServiceException(type: $type)';
}
