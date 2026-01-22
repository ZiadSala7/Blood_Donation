import 'dart:developer';

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
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  Future register({
    required String fullName,
    required String email,
    required num age,
    required num bloodTypeId,
    required num gender,
    required num cityId,
    required String password,
    required String phoneNum,
  }) async {
    emit(RegisterLoading());

    final response = await repo.createAccount(
      fullName: fullName,
      email: email,
      age: age,
      bloodTypeId: bloodTypeId,
      gender: gender,
      cityId: cityId,
      password: password,
      phoneNum: phoneNum,
    );
    response.fold(
      (ifLeft) => emit(RegisterFailure()),
      (ifRight) => emit(RegisterSuccess()),
    );
  }
}
