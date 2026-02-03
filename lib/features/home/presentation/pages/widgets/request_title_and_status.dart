import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class RequestTitleAndStatus extends StatelessWidget {
  final String title, status;
  const RequestTitleAndStatus({super.key, required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text("حالة طارئة – حادث سير", style: AppTextStyles.b24(context)),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(18),
          ),

          child: Text("مفتوح", style: AppTextStyles.r18(context)),
        ),
      ],
    );
  }
}
