import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

final authInterceptorProvider = Provider(
  (ref) => AuthInterceptor(
    sharedPrefsService: ref.read(sharedPrefsServiceProvider),
  ),
);

class AuthInterceptor extends ClientInterceptor {
  final SharedPrefsService _sharedPrefsService;

  // you can get them from the from the generated gRPC files.
  final _unauthenticatedRPCs = [
    '/Auth/Login',
  ];

  AuthInterceptor({
    required SharedPrefsService sharedPrefsService,
  }) : _sharedPrefsService = sharedPrefsService;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    if (!_unauthenticatedRPCs.contains(method.path)) {
      final accessToken = _sharedPrefsService.getAccessToken();
      if (accessToken == null) {
        throw Exception('no access token found');
      }

      options.metadata.addAll({'authorization': 'Bearer $accessToken'});
    }

    return invoker(method, request, options);
  }
}
