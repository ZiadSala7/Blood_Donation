import 'package:blood_donation/core/api/end_points.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/api/api_keys.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../domain/repo/forget_password_repo.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final DioConsumer dio;

  ForgetPasswordRepoImpl({required this.dio});
  @override
  Future<Either<String, bool>> verifyEmail({required String email}) async {
    try {
      await dio.post(EndPoints.forgPass, data: {ApiKeys.email: email});
      return const Right(true);
    } catch (e) {
      return const Left(
        "لم يتم العثور على المستخدم الذي يحمل البريد الإلكتروني",
      );
    }
  }
}
