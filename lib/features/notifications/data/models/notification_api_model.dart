import 'package:flutter/material.dart';

import '../../../../core/services/notifications/api_notification.dart';
import '../utils/time_ago_utils.dart';
import 'notification_item.dart';

/// Maps API notification (or raw JSON) to UI [NotificationItem].
NotificationItem notificationItemFromApi(
  ApiNotification api,
  BuildContext context, {
  bool isRead = false,
  int? notificationType,
}) {
  return NotificationItem(
    id: api.id,
    type: _mapApiTypeToCardType(
      api.type,
      notificationType: notificationType,
    ),
    title: api.title,
    body: api.body,
    subtitle: api.data?['subtitle']?.toString() ?? api.screen,
    timeAgo: timeAgoFromDateTime(context, api.receivedAt),
    isRead: isRead,
    receivedAt: api.receivedAt,
  );
}

NotificationCardType _mapApiTypeToCardType(
  NotificationType type, {
  int? notificationType,
}) {
  if (notificationType != null) {
    switch (notificationType) {
      case 1:
        return NotificationCardType.bloodRequest;
      case 2:
        return NotificationCardType.donorAccepted;
      case 3:
        return NotificationCardType.thankYou;
      case 4:
        return NotificationCardType.requestCompleted;
      default:
        return NotificationCardType.importantAlert;
    }
  }
  switch (type) {
    case NotificationType.bloodRequest:
      return NotificationCardType.bloodRequest;
    case NotificationType.bloodRequestAccepted:
    case NotificationType.newDonor:
      return NotificationCardType.donorAccepted;
    case NotificationType.bloodRequestCompleted:
      return NotificationCardType.requestCompleted;
    case NotificationType.bloodRequestCancelled:
    case NotificationType.reminder:
    case NotificationType.emergency:
    case NotificationType.announcement:
    case NotificationType.general:
      // Map all generic/announcement types to an alert-style card
      // instead of the "شكرا لك" thank-you card to avoid wrong wording.
      return NotificationCardType.importantAlert;
  }
}
