import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';

class RememberMeCheckBox extends StatelessWidget {
  const RememberMeCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.check_box_outline_blank,
            color: AppColors.greyBorder,
          ),
        ),
        Text(
          S.of(context).rememberMe,
          style: AppTextStyles.s18(context).copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
