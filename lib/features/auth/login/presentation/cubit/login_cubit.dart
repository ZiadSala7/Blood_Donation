import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/login_repo_impl.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepoImpl repo;
  LoginCubit(this.repo) : super(LoginInitial());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool rememberMe = false;
  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final response = await repo.login(email: email, password: password);
    response.fold(
      (ifLeft) => emit(LoginFailure()),
      (ifRight) => emit(LoginSuccess(model: ifRight)),
    );
  }
}
