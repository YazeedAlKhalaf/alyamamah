import 'dart:convert';

import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class SessionExpiredInterceptor extends Interceptor {
  final _log = Logger('SessionExpiredInterceptor');

  final SharedPrefsService _sharedPrefsService;

  SessionExpiredInterceptor({
    required SharedPrefsService sharedPrefsService,
  }) : _sharedPrefsService = sharedPrefsService;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    /// I know this looks a hacky way but the guys who made the API,
    /// didn't make it easy for us to know if the session has expired :)
    if (response.data is String &&
        (response.data as String).contains('/yu/init')) {
      _log.severe(
        'getStudentSchedule | session expired, renewing automatically.',
      );

      final username = _sharedPrefsService.getUsername();
      final password = _sharedPrefsService.getPassword();
      final encodedCredentials = base64Encode(
        utf8.encode('$username:$password'),
      );

      final dio = Dio();
      final headers = response.requestOptions.headers;
      headers['Authorization'] = 'Basic $encodedCredentials';
      final newOptions = response.requestOptions.copyWith(headers: headers);
      final authenticatedResponse = await dio.fetch(newOptions);

      handler.next(authenticatedResponse);
      return;
    }

    handler.next(response);
  }
}
