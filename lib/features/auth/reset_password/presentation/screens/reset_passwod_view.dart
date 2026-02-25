import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/di/injection.dart';
import '../../data/repo/reset_password_repo_impl.dart';
import '../cubit/reset_password_cubit.dart';
import '../widgets/reset_password_bloc_consumer.dart';

class ResetPasswodView extends StatelessWidget {
  final String resetToken;
  final String email;
  const ResetPasswodView({
    super.key,
    required this.resetToken,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResetPasswordCubit(repo: ResetPasswordRepoImpl(dio: getIt.get<DioConsumer>())),
      child: Scaffold(
        body: ResetPasswordBlocConsumer(resetToken: resetToken, email: email),
      ),
    );
  }
}
