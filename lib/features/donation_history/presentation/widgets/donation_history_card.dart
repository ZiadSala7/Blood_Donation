import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/donation_history_item.dart';

class DonationHistoryCard extends StatelessWidget {
  final DonationHistoryItem item;
  final String dateText;

  const DonationHistoryCard({
    super.key,
    required this.item,
    required this.dateText,
  });

  @override
  Widget build(BuildContext context) {
    final typeText =
        (item.donationCategoryName == null ||
            item.donationCategoryName!.trim().isEmpty)
        ? S.of(context).donationHistoryUnknownType
        : item.donationCategoryName!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x12000000),
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.commonClr,
                      size: 18,
                    ),
                    Text(
                      dateText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  spacing: 5,
                  children: [
                    Image.asset(AppAssets.assetsImagesBlood, height: 18),
                    Text(
                      typeText,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
