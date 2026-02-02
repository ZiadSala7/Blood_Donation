import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';

class AddRequestView extends StatelessWidget {
  const AddRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            /// Divider
            CreateDonationRequestDivider(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomButton(onPressed: () {}, label: S.of(context).addRqustBtn),
      ),
    );
  }
}

class CreateDonationRequestDivider extends StatelessWidget {
  const CreateDonationRequestDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: .start,
        crossAxisAlignment: .end,
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.commonClr,
              endIndent: 3,
              indent: 10,
            ),
          ),
          Text(
            "إنشاء طلب تبرع",
            style: AppTextStyles.b22(context),
            textAlign: .center,
          ),
          const Expanded(
            child: Divider(
              color: AppColors.commonClr,
              indent: 3,
              endIndent: 10,
            ),
          ),
        ],
      ),
    );
  }
}
