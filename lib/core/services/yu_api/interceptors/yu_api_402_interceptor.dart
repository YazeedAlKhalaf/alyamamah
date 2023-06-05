import 'package:dio/dio.dart';

class YuApi402Interceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.badResponse &&
        err.response != null &&
        err.response!.statusCode == 402) {
      handler.resolve(err.response!);
      return;
    }

    super.onError(err, handler);
  }
}
