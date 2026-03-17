import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import 'notification_card_base.dart';

/// New blood donation request notification (طلب تبرع دم جديد).
class BloodRequestNotificationCard extends StatelessWidget {
  final String body;
  final String? subtitle;
  final DateTime receivedAt;
  final bool isRead;
  final VoidCallback? onTap;

  const BloodRequestNotificationCard({
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
      icon: const Icon(Symbols.water_drop_rounded, color: AppColors.commonClr, size: 24),
      iconBackgroundColor: const Color(0xFFFFE5E5),
      title: S.of(context).notificationBloodRequestTitle,
      body: body,
      subtitle: subtitle,
      receivedAt: receivedAt,
      isRead: isRead,
      cardColor: const Color(0xFFFFF5F5),
      onTap: onTap,
    );
  }
}
