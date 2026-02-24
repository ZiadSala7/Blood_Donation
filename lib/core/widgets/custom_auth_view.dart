import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class CustomAuthView extends StatelessWidget {
  final Widget widget;
  final double barHeight, imageHeight;
  const CustomAuthView({
    super.key,
    required this.widget,
    this.barHeight = 150,
    this.imageHeight = 100,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          toolbarHeight: barHeight,
          backgroundColor: AppColors.commonClr,
          automaticallyImplyLeading: false,
          title: Image.asset(
            AppAssets.assetsImagesBldLogo,
            height: imageHeight,
          ),
          centerTitle: true,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: widget,
          ),
        ),
      ],
    );
  }
}
