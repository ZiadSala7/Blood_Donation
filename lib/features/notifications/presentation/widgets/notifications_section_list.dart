import 'package:flutter/material.dart';

import '../../data/models/notification_item.dart';
import 'notification_card_from_item.dart';

class NotificationsSectionList extends StatelessWidget {
  final List<NotificationItem> items;
  final void Function(NotificationItem)? onNotificationTap;

  const NotificationsSectionList({
    super.key,
    required this.items,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: NotificationCardFromItem(
              item: item,
              onTap:
                  onNotificationTap != null ? () => onNotificationTap!(item) : null,
            ),
          );
        }, childCount: items.length),
      ),
    );
  }
}
