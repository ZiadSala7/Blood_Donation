import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/models/notification_item.dart';
import 'notifications_section_header.dart';
import 'notifications_section_list.dart';
import 'notifications_sliver_app_bar.dart';

class NotificationsViewBody extends StatelessWidget {
  final List<NotificationItem> todayItems;
  final List<NotificationItem> yesterdayItems;
  final List<NotificationItem> olderItems;
  final VoidCallback? onMarkAllRead;
  final void Function(NotificationItem)? onNotificationTap;

  const NotificationsViewBody({
    super.key,
    required this.todayItems,
    required this.yesterdayItems,
    required this.olderItems,
    this.onMarkAllRead,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const NotificationsSliverAppBar(),
        if (todayItems.isNotEmpty) ...[
          NotificationsSectionHeader(
            title: S.of(context).todayLabel,
            actionLabel: S.of(context).markAllAsRead,
            onActionTap: onMarkAllRead,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          ),
          NotificationsSectionList(
            items: todayItems,
            onNotificationTap: onNotificationTap,
          ),
        ],
        if (yesterdayItems.isNotEmpty) ...[
          NotificationsSectionHeader(
            title: S.of(context).yesterdayLabel,
          ),
          NotificationsSectionList(
            items: yesterdayItems,
            onNotificationTap: onNotificationTap,
          ),
        ],
        if (olderItems.isNotEmpty) ...[
          NotificationsSectionHeader(
            title: S.of(context).earlierLabel,
          ),
          NotificationsSectionList(
            items: olderItems,
            onNotificationTap: onNotificationTap,
          ),
        ],
      ],
    );
  }
}
