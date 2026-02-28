import 'package:dartz/dartz.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../domain/repo/change_password_repo.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final DioConsumer dio;

  ChangePasswordRepoImpl({required this.dio});
  @override
  Future<Either<String, String>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await dio.post(
        EndPoints.changePass,
        data: {'oldPassword': oldPassword, 'newPassword': newPassword},
      );
      return const Right('نم تغيير كلمة مرورك بنجاح');
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
