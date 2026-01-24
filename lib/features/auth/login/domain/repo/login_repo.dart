import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../register/data/models/register_model.dart';

abstract class LoginRepo {
  Future<Either<ErrorModel, RegisterModel>> login({
    required String email,
    required String password,
  });
}
