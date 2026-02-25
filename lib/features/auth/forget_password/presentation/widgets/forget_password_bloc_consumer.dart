import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/widgets/show_awesome_dialog.dart';
import '../cubit/forget_cubit.dart';
import '../cubit/forget_state.dart';
import 'forget_password_view_body.dart';

class ForgetPasswordBlocConsumer extends StatelessWidget {
  const ForgetPasswordBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetCubit, ForgetStates>(
      listener: (context, state) {
        if (state is SuccessForgetState) {
          // we will navigate to the otp verification view
          context.pushNamed(
            AppRoutes.otpVerificationName,
            extra: context.read<ForgetCubit>().forgetPassEmail.text,
          );
        } else if (state is FailureForgetState) {
          showAwesomeDialog(
            context,
            "فشلت العملية",
            state.errMsg,
            false,
            () {},
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingForgetState ? true : false,
          child: const ForgetPasswordViewBody(),
        );
      },
    );
  }
}
