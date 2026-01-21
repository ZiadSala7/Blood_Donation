import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../data/onboarding_model.dart';
import 'onboarding_view.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> onbrdngs = onboardingModels(context);
    return PageView(
      controller: AppConstants.onbrdngPageCntroller,
      scrollDirection: Axis.horizontal,
      children: List.generate(
        onbrdngs.length,
        (index) => OnboardingView(model: onbrdngs[index]),
      ),
    );
  }
}
