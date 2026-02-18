import 'package:flutter/material.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/databases/cach_helper.dart';
import '../../../../../core/widgets/bottom_nav_bar.dart';
import '../../../../auth/login/presentation/pages/login_view.dart';
import '../../../../onboarding/presentation/views/onboarding_page_view.dart';

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

    Future.delayed(const Duration(seconds: 4), () {
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
    final size = MediaQuery.of(context).size;
    final circleDiameter = size.longestSide * 1.2;
    final logoHeight = (size.shortestSide * 0.12).clamp(50.0, 160.0);

    final prefs = getIt.get<CacheHelper>();
    final isOnbordActive = prefs.getBool('isOnbordActive');
    final remembered = prefs.getBool('rememberMe');
    return Stack(
      children: [
        isOnbordActive != null
            ? remembered != null
                  ? const BottomNavBar()
                  : const LoginView()
            : const OnboardingPageView(),
        Positioned(
          top: -circleDiameter * 0.2, // pull circle slightly above the top
          left: size.width / 2 - circleDiameter / 2, // center circle horizontally
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: circleDiameter,
              height: circleDiameter,
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
            child: Image.asset(
              AppAssets.assetsImagesBldLogo,
              height: logoHeight,
            ),
          ),
        ),
      ],
    );
  }
}
