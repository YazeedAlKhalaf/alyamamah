// ignore_for_file: public_member_api_docs, sort_constructors_first
enum YuApiServiceExceptionType {
  unknown,
  invalidCredentials,
  sessionExpired,
  invalidRequest,
  paymentRequired
}

class YuApiServiceException implements Exception {
  final YuApiServiceExceptionType type;

  const YuApiServiceException([this.type = YuApiServiceExceptionType.unknown]);

  @override
  String toString() => 'YuApiServiceException(type: $type)';
}
