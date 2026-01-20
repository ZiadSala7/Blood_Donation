import 'package:blood_donation/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class OnboardingModel {
  final String image, title, subTitle;
  final int index;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.index,
  });
}

List<OnboardingModel> onbordingModels(BuildContext context) => [
  OnboardingModel(
    image: AppAssets.assetsImagesBldOnbrd1,
    title: S.of(context).onbrd1Title,
    subTitle: S.of(context).onbrd1Descr,
    index: 0,
  ),
  OnboardingModel(
    image: AppAssets.assetsImagesBldOnbrd2,
    title: S.of(context).onbrd2Title,
    subTitle: S.of(context).onbrd2Descr,
    index: 1,
  ),
  OnboardingModel(
    image: AppAssets.assetsImagesBldOnbrd3,
    title: S.of(context).onbrd3Title,
    subTitle: S.of(context).onbrd3Descr,
    index: 2,
  ),
  OnboardingModel(
    image: AppAssets.assetsImagesBldOnbrd4,
    title: S.of(context).onbrd4Title,
    subTitle: S.of(context).onbrd4Descr,
    index: 3,
  ),
];
