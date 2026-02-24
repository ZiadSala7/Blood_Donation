import 'package:dartz/dartz.dart';

abstract class ForgetPasswordRepo {
  Future<Either<String, bool>> verifyEmail({required String email});
}
