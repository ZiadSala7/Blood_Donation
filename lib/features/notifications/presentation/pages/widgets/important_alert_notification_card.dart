import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'notification_card_base.dart';

/// Important alert notification (تنبيه هام).
class ImportantAlertNotificationCard extends StatelessWidget {
  final String body;
  final String? subtitle;
  final DateTime receivedAt;
  final bool isRead;
  final VoidCallback? onTap;

  const ImportantAlertNotificationCard({
    super.key,
    required this.body,
    this.subtitle,
    required this.receivedAt,
    this.isRead = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationCardBase(
      icon: const Icon(
        Symbols.warning_rounded,
        color: Color(0xFFE65100),
        size: 24,
      ),
      iconBackgroundColor: const Color(0xFFFFF3E0),
      title: 'تنبيه هام',
      body: body,
      subtitle: subtitle,
      receivedAt: receivedAt,
      isRead: isRead,
      cardColor: const Color(0xFFFFF8F0),
      onTap: onTap,
    );
  }
}
