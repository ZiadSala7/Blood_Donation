import 'package:dartz/dartz.dart';

import '../../../../../core/api/api_keys.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../domain/repo/otp_repo.dart';

class OtpRepoImpl implements OtpRepo {
  final DioConsumer dio;

  OtpRepoImpl({required this.dio});
  @override
  Future<Either<String, String>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await dio.post(
        EndPoints.verifyOtp,
        data: {ApiKeys.email: email, ApiKeys.otp: otp},
      );
      final resetToken = response['resetToken'];
      return Right(resetToken);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, bool>> resendOtp({required String email}) async {
    try {
      await dio.post(EndPoints.forgPass, data: {ApiKeys.email: email});
      return const Right(true);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
