import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';
import '../../data/repo/login_repo_impl.dart';
import '../../../../../core/api/api_keys.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/helper/get_user.dart';
import '../../../../../core/databases/cach_helper.dart';
import '../../../register/data/models/register_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepoImpl repo;
  LoginCubit(this.repo) : super(LoginInitial());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool rememberMe = false;
  RegisterModel? model;

  Future<void> cachedData() async {
    final prefs = getIt.get<CacheHelper>();
    final rem = prefs.getBool('rememberMe');
    model = rem == true ? getCachedUser() : null;
    rem == true ? prefs.setString(ApiKeys.token, model!.token!) : null;
  }

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final response = await repo.login(email: email, password: password);
    response.fold(
      (ifLeft) => emit(LoginFailure(errMsg: ifLeft.errorMessage!)),
      (ifRight) {
        model = ifRight;
        CacheHelper().setString(ApiKeys.token, model!.token!);
        emit(LoginSuccess(model: ifRight));
      },
    );
  }
}
