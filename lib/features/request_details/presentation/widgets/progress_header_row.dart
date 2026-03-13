import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';

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
          S.of(context).collectedBagsCount(collectedBags ?? 0, bagsCount ?? 0),
          style: AppTextStyles.r16(
            context,
          ).copyWith(color: AppColors.commonClr),
        ),
        Text(
          S.of(context).requestCompletionPercent((progress * 100).toInt()),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
