import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/change_password_repo_impl.dart';
import 'change_password_states.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  final ChangePasswordRepoImpl repo;
  ChangePasswordCubit({required this.repo}) : super(ChangeInitial());

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> changePass(String oldPassword, String newPassword) async {
    emit(ChangeLoading());
    final response = await repo.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    response.fold(
      (errMsg) => emit(ChangeFailure(errMsg: errMsg)),
      (successMsg) => emit(ChangeSuccess(successMsg: successMsg)),
    );
  }
}
