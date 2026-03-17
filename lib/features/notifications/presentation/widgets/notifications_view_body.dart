import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/notification_item.dart';
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
    final hasNotifications =
        todayItems.isNotEmpty ||
        yesterdayItems.isNotEmpty ||
        olderItems.isNotEmpty;
    return CustomScrollView(
      slivers: [
        const NotificationsSliverAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: hasNotifications ? onMarkAllRead : null,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.grey,
                  disabledForegroundColor: AppColors.grey2,
                  textStyle: AppTextStyles.r16(
                    context,
                  ).copyWith(fontFamily: 'Cairo'),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(0, 32),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(S.of(context).markAllAsRead),
              ),
            ),
          ),
        ),
        if (todayItems.isNotEmpty) ...[
          NotificationsSectionHeader(
            title: S.of(context).todayLabel,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          ),
          NotificationsSectionList(
            items: todayItems,
            onNotificationTap: onNotificationTap,
          ),
        ],
        if (yesterdayItems.isNotEmpty) ...[
          NotificationsSectionHeader(title: S.of(context).yesterdayLabel),
          NotificationsSectionList(
            items: yesterdayItems,
            onNotificationTap: onNotificationTap,
          ),
        ],
        if (olderItems.isNotEmpty) ...[
          NotificationsSectionHeader(title: S.of(context).earlierLabel),
          NotificationsSectionList(
            items: olderItems,
            onNotificationTap: onNotificationTap,
          ),
        ],
      ],
    );
  }
}
