import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class RequestDeadline extends StatelessWidget {
  const RequestDeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time, color: AppColors.grey2),
        Text(
          "اّخر موعد للتبرع : ",
          style: AppTextStyles.b14(context).copyWith(color: AppColors.grey),
        ),
        Text(
          "16 يناير",
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
