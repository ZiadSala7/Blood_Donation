import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/notification_item.dart';
import 'notification_card_from_item.dart';

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
        SliverAppBar(
          pinned: true,
          floating: false,
          snap: false,
          scrolledUnderElevation: 0,
          title: Text(S.of(context).notificationsTitle),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
        ),
        if (todayItems.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).todayLabel,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  InkWell(
                    onTap: onMarkAllRead,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, size: 6, color: AppColors.grey),
                        const SizedBox(width: 8),
                        Text(
                          S.of(context).markAllAsRead,
                          style: TextStyle(fontSize: 13, color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = todayItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: NotificationCardFromItem(
                    item: item,
                    onTap: onNotificationTap != null
                        ? () => onNotificationTap!(item)
                        : null,
                  ),
                );
              }, childCount: todayItems.length),
            ),
          ),
        ],
        if (yesterdayItems.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                S.of(context).yesterdayLabel,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = yesterdayItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: NotificationCardFromItem(
                    item: item,
                    onTap: onNotificationTap != null
                        ? () => onNotificationTap!(item)
                        : null,
                  ),
                );
              }, childCount: yesterdayItems.length),
            ),
          ),
        ],
        if (olderItems.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                S.of(context).earlierLabel,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = olderItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: NotificationCardFromItem(
                    item: item,
                    onTap: onNotificationTap != null
                        ? () => onNotificationTap!(item)
                        : null,
                  ),
                );
              }, childCount: olderItems.length),
            ),
          ),
        ],
      ],
    );
  }
}
