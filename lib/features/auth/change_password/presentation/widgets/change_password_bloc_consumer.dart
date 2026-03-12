import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/show_awesome_dialog.dart';
import '../../../../../generated/l10n.dart';
import '../cubit/change_password_cubit.dart';
import '../cubit/change_password_states.dart';
import 'change_password_view_body.dart';

class ChangePasswordBlocConsumer extends StatelessWidget {
  const ChangePasswordBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordStates>(
      listener: (context, state) {
        if (state is ChangeSuccess) {
          showAwesomeDialog(
            context,
            S.of(context).operationSuccessTitle,
            state.successMsg,
            true,
            () {},
          );
        } else if (state is ChangeFailure) {
          showAwesomeDialog(
            context,
            S.of(context).errorTitle,
            state.errMsg,
            false,
            () {},
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ChangeLoading ? true : false,
          child: const ChangePasswordViewBody(),
        );
      },
    );
  }
}
