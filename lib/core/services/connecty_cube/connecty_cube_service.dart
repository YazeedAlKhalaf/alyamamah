import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/services/connecty_cube/connecty_cube_service_exception.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectyCubeServiceProvider = Provider(
  (ref) => ConnectyCubeService(
    cubeSettings: CubeSettings.instance,
  ),
);

class ConnectyCubeService {
  final CubeSettings _cubeSettings;

  ConnectyCubeService({
    required CubeSettings cubeSettings,
  }) : _cubeSettings = cubeSettings {
    init();
  }

  void init() {
    _cubeSettings.init(
      Constants.connectyCubeAppId,
      Constants.connectyCubeAuthKey,
      Constants.connectyCubeAuthSecret,
    );
  }

  Future<CubeSession> login({
    required String accessToken,
  }) async {
    try {
      final cubeSession = await createSession(CubeUser(
        login: accessToken,
        // This is just to satisfy the API, but only the login field is used.
        password: 'password',
      ));

      return cubeSession;
    } catch (e) {
      throw ConnectyCubeServiceException();
    }
  }

  Future<PagedResult<CubeDialog>?> getChats() async {
    try {
      final pagedResult = await getDialogs();

      return pagedResult;
    } catch (e) {
      throw ConnectyCubeServiceException();
    }
  }
}
