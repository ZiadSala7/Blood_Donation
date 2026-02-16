// lib/services/notifications/fcm_notification_service.dart

import 'package:firebase_messaging/firebase_messaging.dart';
import 'api_notification.dart';
import 'app_notification_handler.dart';

// Top-level background handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final _ = ApiNotification.fromJson({
    'id': message.messageId,
    'title': message.notification?.title ?? 'Notification',
    'body': message.notification?.body ?? '',
    'type': message.data['type'],
    'data': message.data,
    'image_url': message.notification?.android?.imageUrl,
    'screen': message.data['screen'],
  });

  // Handle background notification
  // Note: You can't use context or navigation here
  // Only save to local database or perform background tasks
}

class FCMNotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final AppNotificationHandler _handler;

  FCMNotificationService({required AppNotificationHandler handler})
    : _handler = handler;

  Future<void> initialize() async {
    // Request permissions
    await _requestPermissions();

    // Set background handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Get initial message (app opened from terminated state)
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      final notification = _convertToApiNotification(initialMessage);
      await _handler.handleTerminatedNotification(notification);
    }

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle notification tap (app in background)
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    // Get FCM token
    await _messaging.getToken();
  }

  Future<void> _requestPermissions() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
  }

  void _handleForegroundMessage(RemoteMessage message) {
    final notification = _convertToApiNotification(message);
    _handler.handleForegroundNotification(notification);
  }

  void _handleNotificationTap(RemoteMessage message) {
    final notification = _convertToApiNotification(message);
    _handler.handleNotificationTap(notification);
  }

  ApiNotification _convertToApiNotification(RemoteMessage message) {
    return ApiNotification.fromJson({
      'id':
          message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      'title': message.notification?.title ?? 'Notification',
      'body': message.notification?.body ?? '',
      'type': message.data['type'],
      'data': message.data,
      // 'priority': message.priority.toString(),
      'image_url':
          message.notification?.android?.imageUrl ??
          message.notification?.apple?.imageUrl,
      'screen': message.data['screen'],
      'action_url': message.data['action_url'],
    });
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }
}
