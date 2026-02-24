import 'package:flutter/material.dart';

import '../../../data/models/notification_item.dart';
import 'blood_request_notification_card.dart';
import 'donor_accepted_notification_card.dart';
import 'important_alert_notification_card.dart';
import 'request_completed_notification_card.dart';
import 'thank_you_notification_card.dart';

/// Builds the appropriate custom notification card for a [NotificationItem].
class NotificationCardFromItem extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback? onTap;

  const NotificationCardFromItem({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    switch (item.type) {
      case NotificationCardType.bloodRequest:
        return BloodRequestNotificationCard(
          body: item.body,
          subtitle: item.subtitle,
          timeAgo: item.timeAgo,
          isRead: item.isRead,
        onTap: onTap,
        );
      case NotificationCardType.donorAccepted:
        return DonorAcceptedNotificationCard(
          body: item.body,
          subtitle: item.subtitle,
          timeAgo: item.timeAgo,
          isRead: item.isRead,
          onTap: onTap,
        );
      case NotificationCardType.thankYou:
        return ThankYouNotificationCard(
          body: item.body,
          subtitle: item.subtitle,
          timeAgo: item.timeAgo,
          isRead: item.isRead,
          onTap: onTap,
        );
      case NotificationCardType.importantAlert:
        return ImportantAlertNotificationCard(
          body: item.body,
          subtitle: item.subtitle,
          timeAgo: item.timeAgo,
          isRead: item.isRead,
          onTap: onTap,
        );
      case NotificationCardType.requestCompleted:
        return RequestCompletedNotificationCard(
          body: item.body,
          subtitle: item.subtitle,
          timeAgo: item.timeAgo,
          isRead: item.isRead,
          onTap: onTap,
        );
    }
  }
}
