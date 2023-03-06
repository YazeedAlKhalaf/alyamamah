import 'dart:convert';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/models/schedule.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/api/interceptors/demo_mode_interceptor.dart';
import 'package:alyamamah/core/services/api/interceptors/session_expired_interceptor.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final apiServiceProvider = Provider(
  (ref) => ApiService(
    dio: Dio(),
    cookieJar: CookieJar(),
    demoModeInterceptor: DemoModeInterceptor(),
    sessionExpiredInterceptor: SessionExpiredInterceptor(
      sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    ),
  ),
);

class ApiService {
  final _log = Logger('ApiService');

  final Dio _dio;
  final CookieJar _cookieJar;
  final DemoModeInterceptor _demoModeInterceptor;
  final SessionExpiredInterceptor _sessionExpiredInterceptor;

  ApiService({
    required Dio dio,
    required CookieJar cookieJar,
    required DemoModeInterceptor demoModeInterceptor,
    required SessionExpiredInterceptor sessionExpiredInterceptor,
  })  : _dio = dio,
        _cookieJar = cookieJar,
        _demoModeInterceptor = demoModeInterceptor,
        _sessionExpiredInterceptor = sessionExpiredInterceptor {
    _dio.options = BaseOptions(
      baseUrl: Constants.apiUrl,
      responseType: ResponseType.json,
    );

    /// This interceptor has an activation path and activation credentials,
    /// once triggered it will start faking all responses. This is useful for
    /// testing purposes.
    _dio.interceptors.add(_demoModeInterceptor);

    /// This interceptor is used to handle session expired errors automatically.
    /// It renews the session and retries the request.
    /// This should be before CookieManager because it needs to intercept the
    /// response before the cookie is saved, otherwise it will save the old
    /// cookie and the next request will fail.
    _dio.interceptors.add(_sessionExpiredInterceptor);

    /// This line makes cookies easier to deal with.
    /// Basically once you login, the server will send you a cookie
    /// that you can use to authenticate yourself in the future and this
    /// line makes it so that the cookie is automatically saved and sent
    /// with every request.
    ///
    /// DON'T USE WITH WEB!
    if (!kIsWeb) {
      _dio.interceptors.add(CookieManager(_cookieJar));
    }
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
        throw const ApiServiceException();
      }

      if (response.data['commonInfo']['status'] == false) {
        _log.severe('login | invalid credentials.');
        throw const ApiServiceException(
          ApiServiceExceptionType.invalidCredentials,
        );
      }

      return ActorDetails.fromMap(response.data);
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('login | unexpected exception: $e.');
      throw const ApiServiceException();
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
        throw const ApiServiceException();
      }

      return (response.data as List<dynamic>)
          .map((x) => Schedule.fromMap(x))
          .toList();
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getStudentSchedule | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }

  Future<void> logout() async {
    await _cookieJar.deleteAll();
    _demoModeInterceptor.disableDemoMode();
  }

  Future<List<Absence>> getAbsences() async {
    try {
      final response = await _dio.get(
        '/resources/student/absences/absences',
      );

      if (response.statusCode != 200) {
        _log.severe('getAbsences | non 200 status code.');
        throw const ApiServiceException();
      }

      return (response.data as List<dynamic>)
          .map((x) => Absence.fromMap(x))
          .toList();
    } catch (e) {
      if (e is ApiServiceException) rethrow;

      _log.severe('getAbsences | unexpected exception: $e.');
      throw const ApiServiceException();
    }
  }
}
