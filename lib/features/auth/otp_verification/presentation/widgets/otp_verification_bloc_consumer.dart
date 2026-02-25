import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/widgets/show_awesome_dialog.dart';
import '../cubit/otp_cubit.dart';
import '../cubit/otp_states.dart';
import 'otp_verification_view_body.dart';

class OtpVerificationBlocConsumer extends StatelessWidget {
  final String email;
  const OtpVerificationBlocConsumer({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpStates>(
      listener: (context, state) {
        if (state is OtpSuccess) {
          // we will navigate to the otp verification view
          context.pushNamed(
            AppRoutes.resetPasswordName,
            extra: {'resetToken': state.resetToken, 'email': email},
          );
        } else if (state is OtpResendSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم إرسال الكود مرة أخرى")),
          );
        } else if (state is OtpFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMsg)));
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
          inAsyncCall: state is OtpLoading ? true : false,
          child: OtpVerificationViewBody(email: email),
        );
      },
    );
  }
}
