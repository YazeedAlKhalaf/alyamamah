import 'dart:convert';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/services/auth/auth_service_exception.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final authServiceProvider = Provider(
  (ref) => AuthService(
    dio: Dio(),
    cookieJar: CookieJar(),
  ),
);

class AuthService {
  final _log = Logger('AuthService');

  final Dio _dio;
  final CookieJar _cookieJar;

  AuthService({
    required Dio dio,
    required CookieJar cookieJar,
  })  : _dio = dio,
        _cookieJar = cookieJar {
    _dio.options = BaseOptions(
      baseUrl: Constants.apiUrl,
      responseType: ResponseType.json,
    );

    /// This line makes cookies easier to deal with.
    /// Basically once you login, the server will send you a cookie
    /// that you can use to authenticate yourself in the future and this
    /// line makes it so that the cookie is automatically saved and sent
    /// with every request.
    _dio.interceptors.add(CookieManager(_cookieJar));
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

  Future<List<Schedule>> getStudentSchedule({
    required String schedule,
  }) async {
    try {
      final response = await _dio.get(
        '/resources/student/schedule/studentSchedule/$schedule',
      );

      if (response.statusCode != 200) {
        _log.severe('getStudentSchedule | non 200 status code.');
        throw const AuthServiceException();
      }

      if (response.data is String &&
          (response.data as String).contains('/yu/init')) {
        _log.severe('getStudentSchedule | session expired.');
        throw const AuthServiceException(
          AuthServiceExceptionType.sessionExpired,
        );
      }

      return (response.data as List<dynamic>)
          .map((x) => Schedule.fromMap(x))
          .toList();
    } catch (e) {
      if (e is AuthServiceException) rethrow;

      _log.severe('getStudentSchedule | unexpected exception: $e.');
      throw const AuthServiceException();
    }
  }

  Future<void> logout() async {
    await _cookieJar.deleteAll();
  }
}
