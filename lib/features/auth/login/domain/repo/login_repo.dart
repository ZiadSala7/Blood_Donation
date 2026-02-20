import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../register/data/models/register_model.dart';

abstract class LoginRepo {
  Future<Either<ErrorModel, RegisterModel>> login({
    required String email,
    required String password,
  });

  Future<Either<ErrorModel, RegisterModel>> loginWithGoogle({
    required String idToken,
  });

  /// Refreshes the token using the current token and refresh token.
  /// Returns new token, refreshToken, and refreshTokenExpiration.
  Future<Either<ErrorModel, Map<String, dynamic>>> refreshToken({
    required String token,
    required String refreshToken,
  });
}
