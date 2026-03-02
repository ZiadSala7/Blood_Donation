import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/data/models/request_model.dart';

class CaseDetailsCard extends StatelessWidget {
  final RequestModel request;
  const CaseDetailsCard(this.request, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 5,
              children: [
                Image.asset(AppAssets.assetsImagesStatusDetails, height: 20),
                const Text(
                  'تفاصيل الحالة',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "اسم الحالة:",
              style: AppTextStyles.b18(
                context,
              ).copyWith(color: AppColors.caseStat),
            ),
            const SizedBox(height: 5),
            Text(request.patientName ?? '-'),
            const SizedBox(height: 15),
            Text(
              "وصف الحالة:",
              style: AppTextStyles.b18(
                context,
              ).copyWith(color: AppColors.caseStat),
            ),
            const SizedBox(height: 5),
            Text(request.description ?? '-'),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
