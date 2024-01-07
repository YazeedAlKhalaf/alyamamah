import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseMessagingServiceProvider = Provider(
  (ref) => FirebaseMessagingService(
    firebaseMessaging: FirebaseMessaging.instance,
  ),
);

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging;

  FirebaseMessagingService({
    required FirebaseMessaging firebaseMessaging,
  }) : _firebaseMessaging = firebaseMessaging;

  Future<void> init() async {
    try {
      await _firebaseMessaging.setAutoInitEnabled(true);
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      return;
    }
  }

  Future<String?> getToken() async {
    try {
      return _firebaseMessaging.getToken();
    } catch (e) {
      return null;
    }
  }

  Future<NotificationSettings> askPermission() async {
    return _firebaseMessaging.requestPermission();
  }
}
