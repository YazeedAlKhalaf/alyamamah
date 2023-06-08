enum YuApiServiceExceptionType {
  unknown,
  invalidCredentials,
  sessionExpired,
  invalidRequest,
  paymentRequired,
  tooManyRequests,
  userIsGenerating
}

class YuApiServiceException implements Exception {
  final YuApiServiceExceptionType type;

  const YuApiServiceException([this.type = YuApiServiceExceptionType.unknown]);

  @override
  String toString() => 'YuApiServiceException(type: $type)';
}