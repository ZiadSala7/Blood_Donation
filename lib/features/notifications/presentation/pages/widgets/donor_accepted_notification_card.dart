import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'notification_card_base.dart';

/// Donor accepted the request notification (متبرع وافق على الطلب).
class DonorAcceptedNotificationCard extends StatelessWidget {
  final String body;
  final String? subtitle;
  final String timeAgo;
  final bool isRead;
  final VoidCallback? onTap;

  const DonorAcceptedNotificationCard({
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
      icon: const Icon(Symbols.check_circle_rounded, color: Colors.white, size: 24),
      iconBackgroundColor: const Color(0xFF81C784),
      title: 'متبرع وافق على الطلب',
      body: body,
      subtitle: subtitle,
      timeAgo: timeAgo,
      isRead: isRead,
      onTap: onTap,
    );
  }
}
