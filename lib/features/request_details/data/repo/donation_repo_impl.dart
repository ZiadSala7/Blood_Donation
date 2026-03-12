import 'package:dartz/dartz.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/api/dio_consumer.dart';
import '../models/donation_response_model.dart';
import '../../domain/repo/donation_repo.dart';

class DonationRepoImpl implements DonationRepo {
  final DioConsumer dio;

  DonationRepoImpl({required this.dio});
  @override
  Future<Either<String, DonationResponseModel>> donateTo({
    required int id,
  }) async {
    try {
      final response = await dio.post(
        EndPoints.createRspnsToRqust,
        queryParameters: {'RequestId': id.toString()},
      );
      final raw = response is Map<String, dynamic>
          ? response
          : <String, dynamic>{};
      final data = raw['data'] is Map<String, dynamic>
          ? raw['data'] as Map<String, dynamic>
          : raw;
      return Right(DonationResponseModel.fromJson(data));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
