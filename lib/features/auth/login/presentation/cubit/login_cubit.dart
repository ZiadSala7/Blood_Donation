import 'dart:convert';
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
  static const String _googleWebClientId =
      "1077293288373-thpj26s8j0u3ho9mg0l3f72hf9hlhq9t.apps.googleusercontent.com";
  bool _isGoogleSignInInitialized = false;

  Future<void> _ensureGoogleSignInInitialized() async {
    if (_isGoogleSignInInitialized) return;
    await _googleSignIn.initialize(serverClientId: _googleWebClientId);
    _isGoogleSignInInitialized = true;
    log("Google Sign-In initialized.");
  }

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
    await response.fold(
      (ifLeft) async => emit(
        LoginFailure(errMsg: ifLeft.errorMessage ?? AppConstants.errMsg),
      ),
      (ifRight) async {
        model = ifRight;
        await _cacheAuthenticatedUser(ifRight);
        emit(LoginSuccess(model: ifRight));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(LoginGoogleLoading());
      await _ensureGoogleSignInInitialized();

      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: [
          "https://accounts.google.com/o/oauth2/auth",
          "https://oauth2.googleapis.com/token",
          "https://www.googleapis.com/oauth2/v1/certs",
        ],
      );

      if (googleUser.authentication.idToken == null) {
        emit(
          LoginFailure(errMsg: "تعذر الحصول على رمز Google، حاول مرة أخرى."),
        );
        return;
      }

      final response = await repo.loginWithGoogle(
        idToken: googleUser.authentication.idToken!,
      );
      await response.fold(
        (ifLeft) async => emit(
          LoginFailure(errMsg: ifLeft.errorMessage ?? AppConstants.errMsg),
        ),
        (ifRight) async {
          model = ifRight;
          rememberMe = true;
          await _cacheAuthenticatedUser(ifRight);
          emit(LoginSuccess(model: ifRight));
        },
      );
    } on GoogleSignInException catch (e, st) {
      log("Google sign-in failed: $e");
      log("Google sign-in stack trace: $st");
      if (e.code == GoogleSignInExceptionCode.canceled) {
        emit(LoginInitial());
        return;
      }
      emit(
        LoginFailure(errMsg: "فشل تسجيل الدخول باستخدام جوجل، حاول مرة أخرى."),
      );
    } catch (e, st) {
      log("Google sign-in failed: $e");
      log("Google sign-in stack trace: $st");
      emit(
        LoginFailure(errMsg: "فشل تسجيل الدخول باستخدام جوجل، حاول مرة أخرى."),
      );
    }
  }

  Future<void> _cacheAuthenticatedUser(RegisterModel user) async {
    final prefs = getIt.get<CacheHelper>();
    await prefs.setString(ApiKeys.token, user.token!);
    if (rememberMe) {
      await prefs.setBool('rememberMe', true);
      await prefs.setString('user', jsonEncode(user.toJson()));
      return;
    }
    await prefs.setBool('rememberMe', false);
    await prefs.remove('user');
  }
}
