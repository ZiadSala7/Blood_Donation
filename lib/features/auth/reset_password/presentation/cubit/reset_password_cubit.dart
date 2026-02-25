import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/reset_password_repo_impl.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  final ResetPasswordRepoImpl repo;
  ResetPasswordCubit({required this.repo}) : super(InitialResetPasswordState());

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> resetPassword({
    required String resetToken,
    required String email,
  }) async {
    emit(LoadingResetPasswordState());
    final response = await repo.resetPassword(
      resetToken: resetToken,
      email: email,
      newPassword: newPassword.text,
    );
    response.fold(
      (ifLeft) => emit(FailureResetPasswordState(errMsg: ifLeft)),
      (_) => emit(SuccessResetPasswordState()),
    );
  }
}
