import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_states.dart';
import '../../data/repo/login_repo_impl.dart';
import '../../../../../core/api/api_keys.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/helper/get_user.dart';
import '../../../../../core/databases/cach_helper.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../register/data/models/register_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepoImpl repo;
  LoginCubit(this.repo) : super(LoginInitial());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool rememberMe = false;
  RegisterModel? model;
  final _googleSignIn = GoogleSignIn.instance;

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
      (ifLeft) => emit(
        LoginFailure(errMsg: ifLeft.errorMessage ?? AppConstants.errMsg),
      ),
      (ifRight) {
        model = ifRight;
        CacheHelper().setString(ApiKeys.token, model!.token!);
        emit(LoginSuccess(model: ifRight));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(LoginGoogleLoading());
      log("Loading ....");
      // Initialize Google Sign-In (must be called once before use)
      await _googleSignIn.initialize(
        serverClientId:
            "1077293288373-tefk1e0hoo8uqo0h0rti1qpu7ek1vlqm.apps.googleusercontent.com",
      );
      log("Initializing ... $_googleSignIn");

      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      log("GoogleUser ... $googleUser");
      log("IdToken ... ${googleUser.authentication.idToken}");

      if (googleUser.authentication.idToken == null) {
        emit(
          LoginFailure(errMsg: "تعذر الحصول على رمز Google، حاول مرة أخرى."),
        );
        return;
      }

      final response = await repo.loginWithGoogle(
        idToken: googleUser.authentication.idToken!,
      );
      response.fold(
        (ifLeft) => emit(
          LoginFailure(errMsg: ifLeft.errorMessage ?? AppConstants.errMsg),
        ),
        (ifRight) {
          model = ifRight;
          CacheHelper().setString(ApiKeys.token, model!.token!);
          emit(LoginSuccess(model: ifRight));
        },
      );
    } catch (e) {
      emit(
        LoginFailure(errMsg: "فشل تسجيل الدخول باستخدام جوجل، حاول مرة أخرى."),
      );
    }
  }
}
