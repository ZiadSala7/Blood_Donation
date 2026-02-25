import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/otp_repo_impl.dart';
import 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  final OtpRepoImpl repo;
  OtpCubit({required this.repo}) : super(OtpInitial());

  String resetToken = '';

  Future<void> verifyOtpByEmail(String email, String otp) async {
    emit(OtpLoading());
    final response = await repo.verifyOtp(email: email, otp: otp);
    response.fold((ifLeft) => emit(OtpFailure(errMsg: ifLeft)), (token) {
      resetToken = token;
      emit(OtpSuccess(resetToken: token));
    });
  }

  Future<bool> resendOtpByEmail(String email) async {
    emit(OtpLoading());
    final response = await repo.resendOtp(email: email);
    return response.fold(
      (ifLeft) {
        emit(OtpFailure(errMsg: ifLeft));
        return false;
      },
      (_) {
        emit(OtpResendSuccess());
        return true;
      },
    );
  }
}
