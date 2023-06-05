import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:flutter/material.dart';

extension ApiServiceExceptionTypeX on ApiServiceExceptionType {
  String mapToString(BuildContext context) {
    switch (this) {
      case ApiServiceExceptionType.unknown:
        return context.s.unknown_service_error;
      case ApiServiceExceptionType.invalidCredentials:
        return context.s.invalid_credentials;
      case ApiServiceExceptionType.sessionExpired:
        return context.s.session_expired;
    }
  }
}
