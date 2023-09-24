import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityServiceProvider =
    StateNotifierProvider<ConnectivityService, bool>(
  (ref) => ConnectivityService(),
);

class ConnectivityService extends StateNotifier<bool> {
  ConnectivityService() : super(true);

  void setConnected(bool isConnected) {
    state = isConnected;
  }
}
