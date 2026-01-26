import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/widgets/custom_auth_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../data/repo/register_repo_impl.dart';
import '../cubit/register_cubit.dart';
import 'widgets/register_view_body_bloc_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(RegisterRepoImpl((getIt.get<DioConsumer>()))),
      child: const Scaffold(
        backgroundColor: AppColors.commonClr,
        body: CustomAuthView(
          widget: RegisterViewBodyBlocConsumer(),
          barHeight: 120,
        ),
      ),
    );
  }
}
