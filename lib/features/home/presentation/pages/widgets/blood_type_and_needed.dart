import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class BloodTypeAndNeeded extends StatelessWidget {
  final String bldType, donationCat;
  const BloodTypeAndNeeded({
    super.key,
    required this.bldType,
    required this.donationCat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.greyInCard,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text("بلازما", style: AppTextStyles.b18(context)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.commonClr),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text("+A", style: AppTextStyles.b24(context)),
        ),
      ],
    );
  }
}
