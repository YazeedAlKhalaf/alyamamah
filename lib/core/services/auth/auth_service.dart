import 'dart:convert';

import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/services/auth/auth_service_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final authServiceProvider = Provider(
  (ref) => AuthService(
    dio: Dio(),
  ),
);

class AuthService {
  final _log = Logger('AuthService');

  final Dio _dio;

  AuthService({
    required Dio dio,
  }) : _dio = dio {
    _dio.options = BaseOptions(
      baseUrl: 'https://edugate.yu.edu.sa/yu',
      responseType: ResponseType.json,
    );
  }

  Future<ActorDetails> login({
    required String username,
    required String password,
  }) async {
    try {
      final encodedCredentials = base64Encode(
        utf8.encode('$username:$password'),
      );

      final response = await _dio.get(
        '/resources/common/commonServies/actorDetails/-1/1/2',
        options: Options(
          headers: {
            'Authorization': 'Basic $encodedCredentials',
          },
        ),
      );

      if (response.statusCode != 200) {
        _log.severe('login | non 200 status code.');
        throw const AuthServiceException();
      }

      if (response.data['commonInfo']['status'] == false) {
        _log.severe('login | invalid credentials.');
        throw const AuthServiceException(
          AuthServiceExceptionType.invalidCredentials,
        );
      }

      return ActorDetails.fromMap(response.data);
    } catch (e) {
      if (e is AuthServiceException) rethrow;

      _log.severe('login | unexpected exception: $e.');
      throw const AuthServiceException();
    }
  }
}
