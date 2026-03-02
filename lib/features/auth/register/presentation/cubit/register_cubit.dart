import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/register_repo_impl.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterRepoImpl repo;
  RegisterCubit(this.repo) : super(RegisterInitial());

  /// =============== Register Process ================
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  Future<void> register({
    required String fullName,
    required String email,
    required DateTime dateOfBirth,
    required num bloodTypeId,
    required num gender,
    required num cityId,
    required String password,
    required String phoneNum,
  }) async {
    emit(RegisterLoading());
    try {
      final response = await repo
          .createAccount(
            fullName: fullName,
            email: email,
            dateOfBirth: dateOfBirth,
            bloodTypeId: bloodTypeId,
            gender: gender,
            cityId: cityId,
            password: password,
            phoneNum: phoneNum,
          )
          .timeout(const Duration(seconds: 15));

      response.fold(
        (ifLeft) => emit(
          RegisterFailure(
            errMsg: ifLeft.errorMessage ?? "حدث حطأ .. حاول مرةاخرى",
          ),
        ),
        (ifRight) => emit(RegisterSuccess()),
      );
    } on TimeoutException {
      emit(RegisterTimeout());
    } catch (e) {
      emit(RegisterFailure(errMsg: e.toString()));
    }
  }

  @override
  Future<void> close() {
    name.dispose();
    email.dispose();
    phone.dispose();
    dateOfBirth.dispose();
    pass.dispose();
    confirmPass.dispose();
    return super.close();
  }
}
