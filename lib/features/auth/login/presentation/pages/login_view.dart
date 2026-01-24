import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_auth_view.dart';
import '../../data/repo/login_repo_impl.dart';
import '../cubit/login_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl(getIt.get<DioConsumer>())),
      child: const Scaffold(
        backgroundColor: AppColors.commonClr,
        body: SafeArea(child: CustomAuthView(widget: LoginViewBody())),
      ),
    );
  }
}
