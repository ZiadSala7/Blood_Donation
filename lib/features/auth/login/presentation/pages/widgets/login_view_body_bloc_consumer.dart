import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/helper/add_user_to_cache_helper.dart';
import '../../../../../../core/widgets/show_awesome_dialog.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_states.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) async {
        if (state is LoginSuccess || state is LoginGoogleSuccess) {
          if (context.read<LoginCubit>().rememberMe) {
            if (state is LoginSuccess) {
              addUserToCacheHelper(state);
            }
          }
          showAwesomeDialog(
            context,
            'تم تسجيل دخولك بنجاح',
            'مرحبا بعودتك',
            true,
            () {},
          );
          GoRouter.of(context).pushNamed('btmNavBar');
        } else if (state is LoginFailure) {
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
          inAsyncCall:
              state is LoginLoading || state is LoginGoogleLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
