import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import 'last_donation_container.dart';

class DonationHistorySummaryCard extends StatelessWidget {
  final int total;
  final String? latestDate;

  const DonationHistorySummaryCard({
    super.key,
    required this.total,
    required this.latestDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.commonClr,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppColors.commonClr.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                Text(
                  S.of(context).donationHistorySummaryTitle,
                  style: AppTextStyles.r16(
                    context,
                  ).copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 8),
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      "$total",
                      style: AppTextStyles.b32(
                        context,
                      ).copyWith(color: AppColors.white),
                    ),
                    Text(
                      "تبرعاً",
                      style: AppTextStyles.b18(
                        context,
                      ).copyWith(color: AppColors.white),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                if (latestDate != null) ...[
                  const SizedBox(width: 12),
                  LastDonationContainer(latestDate: latestDate),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
