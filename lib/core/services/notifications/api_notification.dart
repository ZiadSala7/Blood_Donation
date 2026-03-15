// lib/core/notifications/api_notification_model.dart

class ApiNotification {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final Map<String, dynamic>? data;
  final DateTime receivedAt;
  final NotificationPriority priority;
  final String? imageUrl;
  final String? actionUrl;
  final String? screen; // Screen to navigate to

  ApiNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    this.data,
    DateTime? receivedAt,
    this.priority = NotificationPriority.normal,
    this.imageUrl,
    this.actionUrl,
    this.screen,
  }) : receivedAt = receivedAt ?? DateTime.now();

  factory ApiNotification.fromJson(Map<String, dynamic> json) {
    return ApiNotification(
      id:
          json['id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      title: json['title'] ?? 'Notification',
      body: json['body'] ?? '',
      type: _parseNotificationType(json['type']),
      data: json['data'] as Map<String, dynamic>?,
      priority: _parseNotificationPriority(json['priority']),
      imageUrl: json['image_url'] as String?,
      actionUrl: json['action_url'] as String?,
      screen: json['screen'] as String?,
      receivedAt: _parseReceivedAt(json['received_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type.toString().split('.').last,
      'data': data,
      'priority': priority.toString().split('.').last,
      'image_url': imageUrl,
      'action_url': actionUrl,
      'screen': screen,
      'received_at': receivedAt.toIso8601String(),
    };
  }

  static NotificationType _parseNotificationType(dynamic type) {
    if (type == null) return NotificationType.general;

    final typeStr = type.toString().toLowerCase();
    return NotificationType.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == typeStr,
      orElse: () => NotificationType.general,
    );
  }

  static NotificationPriority _parseNotificationPriority(dynamic priority) {
    if (priority == null) return NotificationPriority.normal;

    final priorityStr = priority.toString().toLowerCase();
    return NotificationPriority.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == priorityStr,
      orElse: () => NotificationPriority.normal,
    );
  }

  static DateTime _parseReceivedAt(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is DateTime) return value;
    final raw = value.toString();
    if (raw.isEmpty) return DateTime.now();
    final hasTimezone =
        raw.contains('Z') || raw.contains('+') || raw.lastIndexOf('-') > 9;
    final parsed = DateTime.tryParse(raw);
    if (parsed == null) return DateTime.now();
    if (hasTimezone) return parsed.toLocal();
    // Treat timestamps without timezone as UTC from API, then convert to local.
    return DateTime.utc(
      parsed.year,
      parsed.month,
      parsed.day,
      parsed.hour,
      parsed.minute,
      parsed.second,
      parsed.millisecond,
      parsed.microsecond,
    ).toLocal();
  }
}

enum NotificationType {
  general,
  bloodRequest,
  bloodRequestAccepted,
  bloodRequestCompleted,
  bloodRequestCancelled,
  newDonor,
  reminder,
  announcement,
  emergency,
}

enum NotificationPriority { low, normal, high, urgent }
