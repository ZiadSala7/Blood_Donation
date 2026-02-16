import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'notification_card_base.dart';

/// Request completion notification (اكتمال الطلب).
class RequestCompletedNotificationCard extends StatelessWidget {
  final String body;
  final String? subtitle;
  final String timeAgo;
  final bool isRead;
  final VoidCallback? onTap;

  const RequestCompletedNotificationCard({
    super.key,
    required this.body,
    this.subtitle,
    required this.timeAgo,
    this.isRead = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationCardBase(
      icon: const Icon(
        Symbols.check_circle_rounded,
        color: Color(0xFF2E7D32),
        size: 24,
      ),
      iconBackgroundColor: const Color(0xFFE8F5E9),
      title: 'اكتمال الطلب',
      body: body,
      subtitle: subtitle,
      timeAgo: timeAgo,
      isRead: isRead,
      onTap: onTap,
    );
  }
}
