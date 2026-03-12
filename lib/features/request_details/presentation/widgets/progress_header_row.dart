import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class ProgressHeaderRow extends StatelessWidget {
  final int? collectedBags;
  final int? bagsCount;
  final double progress;

  const ProgressHeaderRow({
    super.key,
    required this.collectedBags,
    required this.bagsCount,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          "تم $collectedBags من $bagsCount",
          style: AppTextStyles.r16(
            context,
          ).copyWith(color: AppColors.commonClr),
        ),
        Text(
          'اكتمال الطلب ${(progress * 100).toInt()}%',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
