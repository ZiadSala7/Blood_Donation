import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_points.dart';
import '../../domain/repo/reset_password_repo.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final DioConsumer dio;

  ResetPasswordRepoImpl({required this.dio});
  @override
  Future<Either<String, bool>> resetPassword({
    required String resetToken,
    required String email,
    required String newPassword,
  }) async {
    try {
      await dio.post(
        EndPoints.resetPass,
        data: {
          'resetToken': resetToken,
          'email': email,
          'newPassword': newPassword,
        },
      );
      return const Right(true);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
