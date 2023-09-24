import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/repository/auth/auth_repository_exception.dart';
import 'package:flutter/material.dart';

extension AuthRepositoryExceptionTypeExtensions on AuthRepositoryExceptionType {
  String mapToString(BuildContext context) {
    switch (this) {
      case AuthRepositoryExceptionType.unknown:
        return context.s.unknown_service_error;
      case AuthRepositoryExceptionType.invalidCredentials:
        return context.s.invalid_credentials;
    }
  }
}
