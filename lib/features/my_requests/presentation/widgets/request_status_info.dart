import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/request_status_utils.dart';

class RequestStatusInfo extends StatelessWidget {
  final String name;
  final RequestStatusType statusType;
  final String time;
  final String? donorId;
  final bool isConfirmed;

  const RequestStatusInfo({
    super.key,
    required this.name,
    required this.statusType,
    required this.time,
    this.donorId,
    this.isConfirmed = false,
  });

  @override
  Widget build(BuildContext context) {
    final statusColorValue = isConfirmed ? Colors.grey : statusColor(statusType);
    final statusText = statusLabel(context, statusType);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyles.b16(context),
          textDirection: TextDirection.rtl,
        ),

        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: statusColorValue,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              statusText,
              style: AppTextStyles.s14(
                context,
              ).copyWith(color: statusColorValue),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          time,
          style: AppTextStyles.r14(context).copyWith(color: AppColors.grey),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
