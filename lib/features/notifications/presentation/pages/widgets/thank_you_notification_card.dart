import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../generated/l10n.dart';
import 'notification_card_base.dart';

/// Thank you notification (شكرا لك).
class ThankYouNotificationCard extends StatelessWidget {
  final String body;
  final String? subtitle;
  final DateTime receivedAt;
  final bool isRead;
  final VoidCallback? onTap;

  const ThankYouNotificationCard({
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
        Symbols.favorite_rounded,
        color:  Color(0xFF42A5F5),
        size: 24,
      ),
      iconBackgroundColor: const Color(0xFFE3F2FD),
      title: S.of(context).notificationThankYouTitle,
      body: body,
      subtitle: subtitle,
      receivedAt: receivedAt,
      isRead: isRead,
      onTap: onTap,
    );
  }
}
