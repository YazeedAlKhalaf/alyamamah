import 'package:alyamamah/core/services/yu_api/fixtures/chat_response.dart';
import 'package:dio/dio.dart';

class YuApiDemoModeInterceptor extends Interceptor {
  bool _isInDemo = false;
  void disableDemoMode() {
    _isInDemo = false;
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
      case '/chat':
        return Response(
          requestOptions: options,
          statusCode: 200,
          data: chatSuccessResponse,
        );
    }
    return null;
  }
}
