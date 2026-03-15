import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exception.dart';
import '../../domain/repo/donation_history_repo.dart';
import '../models/donation_history_response.dart';

class DonationHistoryRepoImpl implements DonationHistoryRepo {
  final DioConsumer dio;

  DonationHistoryRepoImpl({required this.dio});

  @override
  Future<Either<String, DonationHistoryResponse>> getDonationHistory({
    int pageIndex = 1,
    int pageSize = 100,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        EndPoints.getDonationHstory,
        data: {
          'pageIndex': pageIndex,
          'pageSize': pageSize,
        },
      );
      if (response is Map<String, dynamic>) {
        return right(DonationHistoryResponse.fromJson(response));
      }
      return left(AppConstants.errMsg);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage ?? AppConstants.errMsg);
    } catch (_) {
      return left(AppConstants.errMsg);
    }
  }
}
