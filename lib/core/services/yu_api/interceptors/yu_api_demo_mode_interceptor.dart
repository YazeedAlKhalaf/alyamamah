import 'dart:typed_data';

import 'package:alyamamah/core/services/yu_api/fixtures/auth_login_response.dart';
import 'package:alyamamah/core/services/yu_api/fixtures/chat_response.dart';
import 'package:dio/dio.dart';

class YuApiDemoModeInterceptor extends Interceptor {
  bool _isInDemo = false;
  void disableDemoMode() {
    _isInDemo = false;
  }

  bool _usedChatTrial = false;
  void resetChatTrial() {
    _usedChatTrial = false;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    tryDemoActivation(options);

    if (_isInDemo) {
      final fakeResponse = getFakeResponse(options);
      if (fakeResponse == null) {
        throw Exception(
          'entered demo mode, but the path ${options.path} is not handled with a fake response.',
        );
      }

      handler.resolve(fakeResponse);
      return;
    }

    handler.next(options);
  }

  void tryDemoActivation(RequestOptions options) {
    const activationUsername = '200011150';
    const activationPassword = 'Aa1234aa@';
    const activationPath = '/auth/login';

    if (options.path == activationPath &&
        options.data['username'] == activationUsername &&
        options.data['password'] == activationPassword) {
      _isInDemo = true;
    }
  }

  Response? getFakeResponse(RequestOptions options) {
    switch (options.path) {
      case '/auth/login':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: authLoginSuccessResponse,
        );
      case '/chat':
        if (_usedChatTrial) {
          return Response(
            requestOptions: options,
            statusCode: 402,
            data: ResponseBody(
              Stream<Uint8List>.fromIterable([]),
              402,
            ),
          );
        }

        _usedChatTrial = true;

        return Response(
          requestOptions: options,
          statusCode: 200,
          data: ResponseBody(
            chatSuccessResponseBodyStream(),
            200,
          ),
        );
    }
    return null;
  }
}
