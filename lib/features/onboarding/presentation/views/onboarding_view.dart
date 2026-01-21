import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/onboarding_model.dart';
import 'widgets/next_and_skip_button.dart';
import 'widgets/page_indicator.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingView({super.key, required this.model});

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
            child: Image.asset(model.image),
          ),
          const SizedBox(height: 16),
          PageIndicator(currentIndex: model.index.toInt()),
          const SizedBox(height: 25),
          Text(
            model.title,
            style: AppTextStyles.b32(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            model.subTitle,
            style: AppTextStyles.b22(
              context,
            ).copyWith(color: AppColors.greyBorder),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          model.index != 3
              ? NextAndSkipButton(index: model.index)
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    onPressed: () {
                      context.pushReplacementNamed('register');
                    },
                    label: S.of(context).startNow,
                  ),
                ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
