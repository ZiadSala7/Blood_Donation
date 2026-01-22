import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getDeviceToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Ask permission (iOS & Android 13+)
  await messaging.requestPermission();

  String? token = await messaging.getToken();
  log("Device Token: $token");

  return token;
}
