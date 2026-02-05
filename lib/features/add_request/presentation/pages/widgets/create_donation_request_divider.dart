import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CreateDonationRequestDivider extends StatelessWidget {
  const CreateDonationRequestDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          const Expanded(
            child: Divider(color: AppColors.commonClr, endIndent: 3),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "إنشاء طلب تبرع",
              style: AppTextStyles.b24(context),
              textAlign: .center,
            ),
          ),
          const Expanded(child: Divider(color: AppColors.commonClr, indent: 3)),
        ],
      ),
    );
  }
}
