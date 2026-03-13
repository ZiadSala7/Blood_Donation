import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/request_status_utils.dart';
import 'request_status_actions.dart';
import 'request_status_avatar.dart';
import 'request_status_info.dart';

class RequestStatusCard extends StatelessWidget {
  final String name;
  final RequestStatusType statusType;
  final String time;
  final String avatarText;
  final Color avatarColor;
  final String? donorId;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const RequestStatusCard({
    super.key,
    required this.name,
    required this.statusType,
    required this.time,
    required this.avatarText,
    required this.avatarColor,
    this.donorId,
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
            statusColor: statusColor(statusType),
          ),
          RequestStatusInfo(
            name: name,
            statusType: statusType,
            time: time,
            donorId: donorId,
          ),
          const Spacer(),
          RequestStatusActions(onAccept: onAccept, onReject: onReject),
        ],
      ),
    );
  }
}
