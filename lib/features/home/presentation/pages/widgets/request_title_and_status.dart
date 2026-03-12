import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class RequestTitleAndStatus extends StatelessWidget {
  final String title, status;
  const RequestTitleAndStatus({
    super.key,
    required this.title,
    required this.status,
  });

  Color _statusColor() {
    final normalized = status.trim().toLowerCase();
    if (status == 'مفتوح' || normalized == 'open') {
      return AppColors.openStatus;
    }
    if (status == 'مكتمل') return Colors.green;
    if (status == 'مغلق') return AppColors.caseStat;
    return AppColors.openStatus;
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor();
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title, style: AppTextStyles.b24(context)),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: statusColor.withOpacity(status == 'مفتوح' ? 0.9 : 0.15),
            borderRadius: BorderRadius.circular(18),
          ),

          child: Text(
            status,
            style: AppTextStyles.r18(context).copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
