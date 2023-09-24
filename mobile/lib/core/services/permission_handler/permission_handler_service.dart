import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionHandlerServiceProvider = Provider((ref) {
  return PermissionHandlerService();
});

class PermissionHandlerService {
  Future<bool> requestNotificationsPermission() async {
    final status = await Permission.notification.request();

    return status.isGranted;
  }

  Future<PermissionStatus> checkNotificationPermissionStatus() async {
    return Permission.notification.status;
  }
}
