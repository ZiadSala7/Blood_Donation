import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/data/models/request_model.dart';

class BloodTypeAndDonationCat extends StatelessWidget {
  const BloodTypeAndDonationCat({super.key, required this.model});

  final RequestModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.greyInCard,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            model.donationCategoryAr!,
            style: AppTextStyles.b18(context),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            model.requiredBloodType!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
