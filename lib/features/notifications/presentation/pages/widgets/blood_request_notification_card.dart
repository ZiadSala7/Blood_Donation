import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../core/utils/app_colors.dart';
import 'notification_card_base.dart';

/// New blood donation request notification (طلب تبرع دم جديد).
class BloodRequestNotificationCard extends StatelessWidget {
  final String body;
  final String? subtitle;
  final String timeAgo;
  final bool isRead;
  final VoidCallback? onTap;

  const BloodRequestNotificationCard({
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
      icon: const Icon(Symbols.water_drop_rounded, color: AppColors.commonClr, size: 24),
      iconBackgroundColor: const Color(0xFFFFE5E5),
      title: 'طلب تبرع دم جديد',
      body: body,
      subtitle: subtitle,
      timeAgo: timeAgo,
      isRead: isRead,
      cardColor: const Color(0xFFFFF5F5),
      onTap: onTap,
    );
  }
}
