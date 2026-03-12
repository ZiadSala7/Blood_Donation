import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'notification_card_base.dart';

/// Donor accepted the request notification (متبرع وافق على الطلب).
class DonorAcceptedNotificationCard extends StatelessWidget {
  final String body;
  final String? subtitle;
  final DateTime receivedAt;
  final bool isRead;
  final VoidCallback? onTap;

  const DonorAcceptedNotificationCard({
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
      icon: const Icon(Symbols.check_circle_rounded, color: Colors.white, size: 24),
      iconBackgroundColor: const Color(0xFF81C784),
      title: 'متبرع وافق على الطلب',
      body: body,
      subtitle: subtitle,
      receivedAt: receivedAt,
      isRead: isRead,
      onTap: onTap,
    );
  }
}
