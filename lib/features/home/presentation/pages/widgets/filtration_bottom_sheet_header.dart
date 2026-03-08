import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FilterBottomSheetHeader extends StatelessWidget {
  const FilterBottomSheetHeader({super.key, required this.onReset});

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close),
        ),
        Text('تصفية وترتيب', style: AppTextStyles.b18(context)),
        TextButton(
          onPressed: onReset,
          child: Text(
            'إعادة ضبط',
            style: AppTextStyles.r16(
              context,
            ).copyWith(color: AppColors.commonClr),
          ),
        ),
      ],
    );
  }
}
