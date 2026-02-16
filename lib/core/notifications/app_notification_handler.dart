// lib/services/notifications/app_notification_handler.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/notifications/api_notification_handler.dart';
import '../../core/utils/app_routes.dart';
import '../../main.dart';
import 'api_notification.dart';

class AppNotificationHandler extends ApiNotificationHandler {
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(ApiNotification)? onNotificationReceived;
  final Function(ApiNotification)? onNotificationDisplayed;

  AppNotificationHandler({
    required this.navigatorKey,
    this.onNotificationReceived,
    this.onNotificationDisplayed,
  });

  @override
  Future<void> handleForegroundNotification(
    ApiNotification notification,
  ) async {
    // Save to local database or state
    await _saveNotificationToLocal(notification);

    // Show in-app notification banner
    _showInAppNotification(notification);

    // Notify listeners
    onNotificationReceived?.call(notification);

    // Handle specific notification types
    await _handleNotificationByType(notification);
  }

  @override
  Future<void> handleBackgroundNotification(
    ApiNotification notification,
  ) async {
    // Save to local database
    await _saveNotificationToLocal(notification);

    // Update badge count
    await _updateBadgeCount();

    // Handle specific actions (like updating local data)
    await _handleNotificationByType(notification);
  }

  @override
  Future<void> handleTerminatedNotification(
    ApiNotification notification,
  ) async {
    // Save to local database
    await _saveNotificationToLocal(notification);

    // Navigate to specific screen
    await handleNotificationTap(notification);
  }

  @override
  Future<void> handleNotificationTap(ApiNotification notification) async {
    // Mark as read
    await _markAsRead(notification.id);

    // Navigate based on notification type or screen
    await _navigateToScreen(notification);

    // Handle specific actions
    await _handleNotificationAction(notification);
  }

  Future<void> _saveNotificationToLocal(ApiNotification notification) async {
    // TODO: Save to local database (Hive, SharedPreferences, SQLite, etc.)
  }

  Future<void> _markAsRead(String notificationId) async {
    // TODO: Mark notification as read in local database
  }

  Future<void> _updateBadgeCount() async {
    // TODO: Update app badge count
  }

  void _showInAppNotification(ApiNotification notification) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    // Show SnackBar or custom notification widget
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(notification.body),
          ],
        ),
        action: SnackBarAction(
          label: 'View',
          onPressed: () => handleNotificationTap(notification),
        ),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
      ),
    );

    onNotificationDisplayed?.call(notification);
  }

  Future<void> _navigateToScreen(ApiNotification notification) async {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    // Navigate to notifications tab in bottom nav bar (tab index 2)
    GoRouter.of(context).go(
      AppRoutes.btmNavBar,
      extra: {'tab': '2'},
    );
  }

  Future<void> _handleNotificationByType(ApiNotification notification) async {
    switch (notification.type) {
      case NotificationType.bloodRequest:
        await _handleBloodRequestNotification(notification);
        break;
      case NotificationType.bloodRequestAccepted:
        await _handleBloodRequestAcceptedNotification(notification);
        break;
      case NotificationType.emergency:
        await _handleEmergencyNotification(notification);
        break;
      default:
        break;
    }
  }

  Future<void> _handleBloodRequestNotification(
    ApiNotification notification,
  ) async {
    // TODO: Update blood requests list, show alert, etc.
  }

  Future<void> _handleBloodRequestAcceptedNotification(
    ApiNotification notification,
  ) async {
    // TODO: Update donations list, show confirmation, etc.
  }

  Future<void> _handleEmergencyNotification(
    ApiNotification notification,
  ) async {
    // TODO: Show emergency alert dialog, play sound, etc.
    final context = navigatorKey.currentContext;
    if (context == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.red),
            SizedBox(width: 8),
            Text('Emergency'),
          ],
        ),
        content: Text(notification.body),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Dismiss'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              handleNotificationTap(notification);
            },
            child: const Text('View Details'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleNotificationAction(ApiNotification notification) async {
    // Handle specific actions from notification data
    final action = notification.data?['action'] as String?;

    if (action != null) {
      switch (action) {
        case 'refresh_requests':
          // TODO: Refresh blood requests
          break;
        case 'update_profile':
          // TODO: Navigate to profile update
          break;
        default:
          break;
      }
    }
  }

  @override
  void dispose() {
    // Clean up resources if needed
  }
}
