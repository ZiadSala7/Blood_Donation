import 'package:flutter/material.dart';

import '../../data/models/notification_item.dart';
import 'notifications_view_body.dart';

class NotificationsLoadedContent extends StatelessWidget {
  final List<NotificationItem> todayItems;
  final List<NotificationItem> yesterdayItems;
  final List<NotificationItem> olderItems;
  final VoidCallback? onMarkAllRead;
  final void Function(NotificationItem)? onNotificationTap;

  const NotificationsLoadedContent({
    super.key,
    required this.todayItems,
    required this.yesterdayItems,
    required this.olderItems,
    this.onMarkAllRead,
    this.onNotificationTap,
  });

  bool get isEmpty =>
      todayItems.isEmpty && yesterdayItems.isEmpty && olderItems.isEmpty;

  @override
  Widget build(BuildContext context) {
    return NotificationsViewBody(
      todayItems: todayItems,
      yesterdayItems: yesterdayItems,
      olderItems: olderItems,
      onMarkAllRead: onMarkAllRead,
      onNotificationTap: onNotificationTap,
    );
  }
}
