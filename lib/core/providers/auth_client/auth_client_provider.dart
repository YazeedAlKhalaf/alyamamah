import 'package:alyamamah/core/interceptors/auth_interceptor.dart';
import 'package:alyamamah/core/providers/quasar_client_channel/quasar_client_channel_provider.dart';
import 'package:alyamamah/gen/proto/auth.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authClientProvider = Provider<AuthClient>(
  (ref) => AuthClient(
    ref.read(quasarClientChannelProvider),
    interceptors: [
      ref.read(authInterceptorProvider),
    ],
  ),
);
