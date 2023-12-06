import 'dart:async';

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

  FutureOr<void> authMetadataProvider(
    Map<String, String> metadata,
    String uri,
  ) {
    final accessToken = _sharedPrefsService.getAccessToken();
    if (accessToken == null) {
      throw Exception('no access token found');
    }

    metadata['authorization'] = 'Bearer $accessToken';
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final providers = <MetadataProvider>[];
    if (!_unauthenticatedRPCs.contains(method.path)) {
      providers.add(authMetadataProvider);
    }

    return invoker(
      method,
      request,
      options.mergedWith(CallOptions(
        providers: providers,
      )),
    );
  }
}
