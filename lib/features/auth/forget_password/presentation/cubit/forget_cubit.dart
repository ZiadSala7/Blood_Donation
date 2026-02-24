import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/forget_password_repo_impl.dart';
import 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetStates> {
  final ForgetPasswordRepoImpl repo;
  ForgetCubit({required this.repo}) : super(InitialForgetState());

  TextEditingController forgetPassEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> verifyEmailToChangePass(String email) async {
    emit(LoadingForgetState());
    final response = await repo.verifyEmail(email: email);
    response.fold(
      (ifLeft) => emit(FailureForgetState(errMsg: ifLeft)),
      (ifRight) => emit(SuccessForgetState()),
    );
  }
}
