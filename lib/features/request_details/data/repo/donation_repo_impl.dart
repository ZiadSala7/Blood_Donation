import 'package:dartz/dartz.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../domain/repo/donation_repo.dart';

class DonationRepoImpl implements DonationRepo {
  final DioConsumer dio;

  DonationRepoImpl({required this.dio});
  @override
  Future<Either<String, String>> donateTo(int id) async {
    try {
      await dio.post(
        EndPoints.createRspnsToRqust,
        queryParameters: {'id': id.toString()},
      );
      return Right()
    } on ServerException catch (e) {}
  }
}
