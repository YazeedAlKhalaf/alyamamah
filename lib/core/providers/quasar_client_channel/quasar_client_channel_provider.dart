import 'package:alyamamah/core/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

final quasarClientChannelProvider = Provider<ClientChannel>(
  (ref) => ClientChannel(
    Constants.quasarApiHost,
    port: Constants.quasarApiPort,
    options: const ChannelOptions(
      credentials: Constants.isQuasarClientChannelSecure
          ? ChannelCredentials.secure()
          : ChannelCredentials.insecure(),
    ),
  ),
);
