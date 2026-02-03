import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class RequestDeadline extends StatelessWidget {
  final DateTime deadline;
  const RequestDeadline({super.key, required this.deadline});

  @override
  Widget build(BuildContext context) {
    String monthName = DateFormat.MMMM().format(deadline);
    int day = deadline.day;
    return Row(
      children: [
        const Icon(Icons.access_time, color: AppColors.grey2),
        Text(
          "اّخر موعد للتبرع : ",
          style: AppTextStyles.b14(context).copyWith(color: AppColors.grey),
        ),
        Text(
          "$day $monthName",
          style: AppTextStyles.b14(context).copyWith(color: AppColors.grey),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {},
          child: Text(
            "عرض المزيد",
            style: AppTextStyles.b14(context).copyWith(color: AppColors.grey2),
          ),
        ),
      ],
    );
  }
}
