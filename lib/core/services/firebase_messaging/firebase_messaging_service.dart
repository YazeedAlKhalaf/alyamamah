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

  Future<String?> getToken() async {
    try {
      return _firebaseMessaging.getToken();
    } catch (e) {
      return null;
    }
  }
}
