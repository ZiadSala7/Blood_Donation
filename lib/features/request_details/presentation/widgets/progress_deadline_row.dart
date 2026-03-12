import 'package:flutter/material.dart';

import '../../../../core/helper/date_time_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class ProgressDeadlineRow extends StatelessWidget {
  final bool isExpired;
  final DateTime? deadline;

  const ProgressDeadlineRow({
    super.key,
    required this.isExpired,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer_outlined,
          color: isExpired ? AppColors.caseStat : null,
        ),
        if (isExpired) ...[
          Text(
            'لم تعد الحالة تستقبل الطلبات',
            style: AppTextStyles.b16(context).copyWith(
              color: AppColors.caseStat,
            ),
          ),
        ] else ...[
          Text('اخر موعد للتبرع : ', style: AppTextStyles.b16(context)),
          Text(
            ' ${deadline!.day} ${getMonthName(deadline!)} ',
            style: AppTextStyles.s16(
              context,
            ).copyWith(color: AppColors.commonClr),
          ),
          Text(
            '(ينتهي خلال ${daysBetween(DateTime.now(), deadline!)} أيام)',
            style: AppTextStyles.r16(
              context,
            ).copyWith(color: AppColors.commonClr),
          ),
        ],
      ],
    );
  }
}
