/// UI model for a single notification in the list.
enum NotificationCardType {
  bloodRequest,
  donorAccepted,
  thankYou,
  importantAlert,
  requestCompleted,
}

class NotificationItem {
  final String id;
  final NotificationCardType type;
  final String title;
  final String body;
  final String? subtitle;
  final String timeAgo;
  final bool isRead;
  final DateTime receivedAt;

  const NotificationItem({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    this.subtitle,
    required this.timeAgo,
    this.isRead = false,
    required this.receivedAt,
  });
}
