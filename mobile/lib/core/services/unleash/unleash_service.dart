import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/providers/package_info/package_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:unleash_proxy_client_flutter/unleash_context.dart';
import 'package:unleash_proxy_client_flutter/unleash_proxy_client_flutter.dart';

final unleashServiceProvider = Provider<UnleashService>((ref) {
  final unleashClient = UnleashClient(
    url: Uri.parse(Constants.unleashUrl),
    clientKey: Constants.unleashClientKey,
    appName: Constants.unleashAppName,
  );

  return UnleashService(
    unleashClient: unleashClient,
    packageInfo: ref.read(packageInfoProvider),
  );
});

class UnleashService {
  final _log = Logger('UnleashService');

  final UnleashClient _unleashClient;
  final PackageInfo _packageInfo;

  UnleashService({
    required UnleashClient unleashClient,
    required PackageInfo packageInfo,
  })  : _unleashClient = unleashClient,
        _packageInfo = packageInfo {
    _unleashClient.on('error', (error) {
      _log.severe('received an error form unleash client: $error');
    });
  }

  bool isEnabled(String featureName) {
    return _unleashClient.isEnabled(featureName);
  }

  Future<void> setUserId(String userId) async {
    await _unleashClient.updateContext(UnleashContext(
      userId: userId,
      properties: {
        'appVersion': _packageInfo.version,
        'appBuildNumber': _packageInfo.buildNumber,
      },
    ));
  }

  Future<void> deleteUserId() async {
    await _unleashClient.updateContext(UnleashContext(
      userId: null,
      properties: {},
    ));
  }

  Future<void> setOnUpdateHandler(Function() onUpdateHandler) async {
    _unleashClient.on('update', (event) {
      onUpdateHandler();
    });

    await _unleashClient.start();
  }
}
