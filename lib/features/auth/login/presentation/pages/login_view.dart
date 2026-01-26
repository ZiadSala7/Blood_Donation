import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_auth_view.dart';
import 'widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.commonClr,
      body: SafeArea(
        child: CustomAuthView(widget: LoginViewBodyBlocConsumer()),
      ),
    );
  }
}
