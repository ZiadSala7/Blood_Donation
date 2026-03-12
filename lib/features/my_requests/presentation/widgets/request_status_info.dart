import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class RequestStatusInfo extends StatelessWidget {
  final String name;
  final String status;
  final String time;

  const RequestStatusInfo({
    super.key,
    required this.name,
    required this.status,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(status);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              status,
              style: AppTextStyles.s14(context).copyWith(color: statusColor),
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
