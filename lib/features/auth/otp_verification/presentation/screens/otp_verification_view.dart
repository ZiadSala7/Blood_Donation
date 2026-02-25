import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/di/injection.dart';
import '../../data/repo/otp_repo_impl.dart';
import '../cubit/otp_cubit.dart';
import '../widgets/otp_verification_bloc_consumer.dart';

class OtpVerificationView extends StatelessWidget {
  final String email;
  const OtpVerificationView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OtpCubit(repo: OtpRepoImpl(dio: getIt.get<DioConsumer>())),
      child: Scaffold(body: OtpVerificationBlocConsumer(email: email)),
    );
  }
}
