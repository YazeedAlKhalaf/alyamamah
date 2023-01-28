import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/services/auth/auth_service_exception.dart';
import 'package:flutter/material.dart';

extension AuthServiceExceptionTypeX on AuthServiceExceptionType {
  String mapAuthServiceExceptionType(BuildContext context) {
    switch (this) {
      case AuthServiceExceptionType.unknown:
        return context.s.unknown_service_error;
      case AuthServiceExceptionType.invalidCredentials:
        return context.s.invalid_credentials;
    }
  }
}
