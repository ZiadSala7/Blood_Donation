import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/widgets/show_awesome_dialog.dart';
import '../cubit/reset_password_cubit.dart';
import '../cubit/reset_password_state.dart';
import 'reset_password_view_body.dart';

class ResetPasswordBlocConsumer extends StatelessWidget {
  final String resetToken;
  final String email;

  const ResetPasswordBlocConsumer({
    super.key,
    required this.resetToken,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
      listener: (context, state) {
        if (state is SuccessResetPasswordState) {
          context.pushReplacementNamed(
            AppRoutes.loginName,
            extra: {'showResetSuccessDialog': true},
          );
        } else if (state is FailureResetPasswordState) {
          showAwesomeDialog(context, "خطأ", state.errMsg, false, () {});
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingResetPasswordState ? true : false,
          child: ResetPasswordViewBody(resetToken: resetToken, email: email),
        );
      },
    );
  }
}
