import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';

abstract class RegisterRepo {
  Future<Either<ErrorModel, bool>> createAccount({
    required String fullName,
    required String email,
    required num age,
    required num bloodTypeId,
    required num gender,
    required num cityId,
    required String password,
    required String phoneNum,
  });
}
