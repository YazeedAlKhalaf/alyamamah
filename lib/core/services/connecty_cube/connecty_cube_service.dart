import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/services/connecty_cube/connecty_cube_service_exception.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final connectyCubeServiceProvider = Provider(
  (ref) => ConnectyCubeService(
    cubeSettings: CubeSettings.instance,
  ),
);

class ConnectyCubeService {
  final _log = Logger('ConnectyCubeService');

  final CubeSettings _cubeSettings;

  ConnectyCubeService({
    required CubeSettings cubeSettings,
  }) : _cubeSettings = cubeSettings {
    init();
  }

  CubeUser? _currentUser;
  CubeUser? get currentUser => _currentUser;

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

      _currentUser = await signIn(CubeUser(
        login: accessToken,
        // This is just to satisfy the API, but only the login field is used.
        password: 'password',
      ));

      _currentUser = await CubeChatConnection.instance.login(CubeUser(
        login: accessToken,
        // This is just to satisfy the API, but only the login field is used.
        password: 'password',
      ));

      return cubeSession;
    } catch (e) {
      _log.severe('login | caught error: $e');
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

  Future<CubeUser?> getUserUsingId({
    required int userId,
  }) async {
    try {
      final user = await getUserById(userId);

      return user;
    } catch (e) {
      throw ConnectyCubeServiceException();
    }
  }

  Future<Map<int, CubeUser>> getUsersByIds({
    required List<int> userIds,
  }) async {
    try {
      final users = await getAllUsersByIds(userIds.toSet());

      return users!.items.asMap().map((key, value) => MapEntry(
            value.id!,
            value,
          ));
    } catch (e) {
      throw ConnectyCubeServiceException();
    }
  }
}
