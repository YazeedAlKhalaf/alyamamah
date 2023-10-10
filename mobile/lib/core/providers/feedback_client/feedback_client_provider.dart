import 'package:alyamamah/core/interceptors/auth_interceptor.dart';
import 'package:alyamamah/core/providers/quasar_client_channel/quasar_client_channel_provider.dart';
import 'package:alyamamah/gen/proto/feedback.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedbackClientProvider = Provider<FeedbackClient>(
  (ref) => FeedbackClient(
    ref.read(quasarClientChannelProvider),
    interceptors: [
      ref.read(authInterceptorProvider),
    ],
  ),
);
