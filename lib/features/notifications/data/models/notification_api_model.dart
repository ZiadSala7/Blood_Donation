import '../../../../core/notifications/api_notification.dart';
import '../utils/time_ago_utils.dart';
import 'notification_item.dart';

/// Maps API notification (or raw JSON) to UI [NotificationItem].
NotificationItem notificationItemFromApi(
  ApiNotification api, {
  bool isRead = false,
}) {
  return NotificationItem(
    id: api.id,
    type: _mapApiTypeToCardType(api.type),
    title: api.title,
    body: api.body,
    subtitle: api.data?['subtitle']?.toString() ?? api.screen,
    timeAgo: timeAgoFromDateTime(api.receivedAt),
    isRead: isRead,
    receivedAt: api.receivedAt,
  );
}

NotificationCardType _mapApiTypeToCardType(NotificationType type) {
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
