import 'package:alyamamah/core/extensions/string.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class YuApiAuthInterceptor extends Interceptor {
  final _log = Logger('YuApiAuthInterceptor');

  final SharedPrefsService _sharedPrefsService;

  YuApiAuthInterceptor({
    required SharedPrefsService sharedPrefsService,
  }) : _sharedPrefsService = sharedPrefsService;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// those paths do not require authentication.
    if (options.path.startsWith('/auth/')) {
      handler.next(options);
      return;
    }

    String? accessToken = _sharedPrefsService.getAccessToken();
    if (accessToken == null) {
      _log.severe('no access token found, this should\'t happen at all.');
      throw Exception('no access token found.');
    }

    if (accessToken.isJwtExpired()) {
      _log.info(
        'access token is expired, renewing automatically.',
      );
      // renew the access token, calling login again.
      final dio = Dio(BaseOptions(
        baseUrl: options.baseUrl,
        headers: options.headers,
      ));

      final username = _sharedPrefsService.getUsername();
      final password = _sharedPrefsService.getPassword();
      final response = await dio.post(
        '/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 401) {
        _log.severe('login | invalid credentials.');
        throw const YuApiServiceException(
          YuApiServiceExceptionType.invalidCredentials,
        );
      }

      if (response.statusCode == 200 &&
          response.data['accessToken'] != null &&
          response.data['message'] == null) {
        accessToken = response.data['accessToken'];
      }
    }

    options.headers['Authorization'] = 'Bearer $accessToken';

    handler.next(options);
  }
}
