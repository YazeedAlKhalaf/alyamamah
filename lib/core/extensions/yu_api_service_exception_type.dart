import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:flutter/material.dart';

extension YuApiServiceExceptionTypeExtensions on YuApiServiceExceptionType {
  String mapToString(BuildContext context) {
    switch (this) {
      case YuApiServiceExceptionType.unknown:
        return context.s.unknown_service_error;
      case YuApiServiceExceptionType.invalidCredentials:
        return context.s.invalid_credentials;
      case YuApiServiceExceptionType.sessionExpired:
        return context.s.session_expired;
      case YuApiServiceExceptionType.invalidRequest:
        return context.s.invalid_request;
      case YuApiServiceExceptionType.paymentRequired:
        return context.s.payment_required;
      case YuApiServiceExceptionType.tooManyRequests:
        return context.s.too_many_requests;
      case YuApiServiceExceptionType.userIsGenerating:
        return context.s.user_is_generating;
    }
  }
}
