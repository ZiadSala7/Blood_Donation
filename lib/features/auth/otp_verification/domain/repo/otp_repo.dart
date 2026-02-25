import 'package:dartz/dartz.dart';

abstract class OtpRepo {
  Future<Either<String, String>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<Either<String, bool>> resendOtp({
    required String email,
  });
}
