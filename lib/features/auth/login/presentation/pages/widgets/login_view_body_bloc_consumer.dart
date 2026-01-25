import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/databases/cach_helper.dart';
import '../../../../../../core/di/injection.dart';
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
        if (state is LoginSuccess) {
          final prefs = getIt.get<CacheHelper>();
          final jsonString = jsonEncode(state.model.toJson());
          prefs.setString('user', jsonString);
          showAwesomeDialog(
            context,
            'تم تسجيل دخولك بنجاح',
            'مرحبا بعودتك',
            true,
            () {
              GoRouter.of(context).pushNamed('btmNavBar');
            },
          );
        } else if (state is LoginFailure) {
          showAwesomeDialog(
            context,
            "فشلت العملية",
            "state.message",
            false,
            () {},
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
