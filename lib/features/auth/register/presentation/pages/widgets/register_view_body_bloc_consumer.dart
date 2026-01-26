import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/widgets/show_awesome_dialog.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_states.dart';
import 'register_view_body.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showAwesomeDialog(
            context,
            'تم انشاء حساب بنجاح',
            'افحص رسائل الايميل لتفعيل الحساب ثم سجل دخولك',
            true,
            () {
              GoRouter.of(context).pushReplacementNamed('login');
            },
          );
        } else if (state is RegisterFailure) {
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
          inAsyncCall: state is RegisterLoading ? true : false,
          child: const RegisterViewBody(),
        );
      },
    );
  }
}
