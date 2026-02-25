import 'package:dartz/dartz.dart';

abstract class ResetPasswordRepo {
  Future<Either<String, bool>> resetPassword({
    required String resetToken,
    required String email,
    required String newPassword,
  });
}
