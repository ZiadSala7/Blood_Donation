import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/di/injection.dart';
import '../../data/repo/change_password_repo_impl.dart';
import '../cubit/change_password_cubit.dart';
import '../widgets/change_password_bloc_consumer.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(
        repo: ChangePasswordRepoImpl(dio: getIt.get<DioConsumer>()),
      ),
      child: const Scaffold(body: ChangePasswordBlocConsumer()),
    );
  }
}
