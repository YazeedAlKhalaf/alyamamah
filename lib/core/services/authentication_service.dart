import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationServiceProvider = Provider(
  (ref) => AuthenticationService(),
);

class AuthenticationService {}
