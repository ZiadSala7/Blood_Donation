import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class LastDonationContainer extends StatelessWidget {
  const LastDonationContainer({super.key, required this.latestDate});

  final String? latestDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffc05559),
      ),
      child: Row(
        children: [
          const Icon(Icons.event, color: AppColors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            "آخر تبرع: $latestDate",
            style: AppTextStyles.r18(context).copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
