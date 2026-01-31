import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getDeviceToken() async {
  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Ask permission (iOS & Android 13+)
    await messaging.requestPermission();

    String? token = await messaging.getToken();

    return token;
  } on FirebaseException catch (e) {
    return e.code;
  }
}
