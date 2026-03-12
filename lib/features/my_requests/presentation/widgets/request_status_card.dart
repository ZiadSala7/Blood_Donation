import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'request_status_actions.dart';
import 'request_status_avatar.dart';
import 'request_status_info.dart';

class RequestStatusCard extends StatelessWidget {
  final String name;
  final String status;
  final String time;
  final String avatarText;
  final Color avatarColor;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const RequestStatusCard({
    super.key,
    required this.name,
    required this.status,
    required this.time,
    required this.avatarText,
    required this.avatarColor,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x14000000),
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        spacing: 10,
        children: [
          RequestStatusAvatar(
            text: avatarText,
            color: avatarColor,
            statusColor: _statusColor(status),
          ),
          RequestStatusInfo(name: name, status: status, time: time),
          const Spacer(),
          RequestStatusActions(onAccept: onAccept, onReject: onReject),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'في الطريق':
        return Colors.green;
      case 'قيد الانتظار':
        return Colors.orange;
      case 'مكتمل':
        return Colors.grey;
      default:
        return AppColors.commonClr;
    }
  }
}
