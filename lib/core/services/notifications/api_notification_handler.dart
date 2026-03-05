// lib/core/notifications/api_notification_handler.dart

import 'api_notification.dart';

/// Abstract class for handling API notifications in different app states
abstract class ApiNotificationHandler {
  /// Handle notification when app is in foreground
  Future<void> handleForegroundNotification(ApiNotification notification);

  /// Handle notification when app is in background
  Future<void> handleBackgroundNotification(ApiNotification notification);

  /// Handle notification when app is terminated and opened via notification tap
  Future<void> handleTerminatedNotification(ApiNotification notification);

  /// Handle notification tap (when user taps on notification)
  Future<void> handleNotificationTap(ApiNotification notification);

  /// Process the notification based on app state
  Future<void> processNotification(
    ApiNotification notification,
    AppState state,
  ) async {
    switch (state) {
      case AppState.foreground:
        await handleForegroundNotification(notification);
        break;
      case AppState.background:
        await handleBackgroundNotification(notification);
        break;
      case AppState.terminated:
        await handleTerminatedNotification(notification);
        break;
    }
  }

  /// Dispose resources
  void dispose();
}

/// App state enum
enum AppState { foreground, background, terminated }
