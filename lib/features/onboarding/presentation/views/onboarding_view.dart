import 'package:blood_donation/core/utils/app_assets.dart';
import 'package:blood_donation/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import 'widgets/next_button.dart';
import 'widgets/page_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .stretch,
        children: [
          const SizedBox(height: 150),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
            child: Image.asset(AppAssets.assetsImagesBldOnbrd1),
          ),
          const SizedBox(height: 16),
          const PageIndicator(currentIndex: 0),
          const SizedBox(height: 25),
          Text(
            S.of(context).onbrd1Title,
            style: AppTextStyles.b28(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).onbrd1Descr,
            style: AppTextStyles.b22(
              context,
            ).copyWith(color: AppColors.greyBorder),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const NextAndSkipButton(),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
