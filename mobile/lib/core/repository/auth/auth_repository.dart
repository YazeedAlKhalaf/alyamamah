import 'package:alyamamah/core/providers/auth_client/auth_client_provider.dart';
import 'package:alyamamah/core/repository/auth/auth_repository_exception.dart';
import 'package:alyamamah/gen/proto/auth.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    authClient: ref.watch(authClientProvider),
  ),
);

class AuthRepository {
  final _log = Logger('AuthRepository');

  final AuthClient _authClient;

  AuthRepository({
    required AuthClient authClient,
  }) : _authClient = authClient;

  Future<LoginResponse> login({
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    try {
      final request = LoginRequest(
        username: username,
        password: password,
        fcmToken: fcmToken,
      );

      final response = await _authClient.login(request);

      return response;
    } on GrpcError catch (e) {
      _log.severe('failed to login with username: $username', e);
      throw AuthRepositoryException();
    }
  }
}
