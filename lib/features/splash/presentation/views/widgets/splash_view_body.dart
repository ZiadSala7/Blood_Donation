// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _scaleAnimation = Tween<double>(
      begin: 3.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    Future.delayed(const Duration(seconds: 5), () {
      _controller.forward().whenComplete(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const OnboardingView(),
        Positioned(
          top: -30, // from the top of the screen
          left: MediaQuery.of(context).size.width / 2 - 250, // center circle
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                color: AppColors.commonClr,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        ScaleTransition(
          scale: _scaleAnimation,
          child: Center(
            child: Image.asset(AppAssets.assetsImagesBldLogo, height: 50),
          ),
        ),
      ],
    );
  }
}
