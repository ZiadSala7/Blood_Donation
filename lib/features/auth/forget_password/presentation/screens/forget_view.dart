import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/di/injection.dart';
import '../../data/repo/forget_password_repo_impl.dart';
import '../cubit/forget_cubit.dart';
import '../widgets/forget_password_bloc_consumer.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(
        repo: ForgetPasswordRepoImpl(dio: getIt.get<DioConsumer>()),
      ),
      child: const Scaffold(body: ForgetPasswordBlocConsumer()),
    );
  }
}
