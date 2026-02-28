import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/data/models/request_model.dart';

class StatusInfoDisplay extends StatelessWidget {
  const StatusInfoDisplay({super.key, required this.model});

  final RequestModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: model.status == "مفتوح" ? AppColors.green : AppColors.grey,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Text(model.status!, style: AppTextStyles.r18(context)),
    );
  }
}
