import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/personal_request_response.dart';
import 'my_requests_repo.dart';

class MyRequestsRepoImpl implements MyRequestsRepo {
  final DioConsumer dio;

  MyRequestsRepoImpl({required this.dio});

  @override
  Future<Either<String, PersonalRequestResponse>> getPersonalRequests({
    int pageIndex = 1,
    int pageSize = 5,
  }) async {
    try {
      final payload = {'PageNumber': pageIndex, 'pagesize': pageSize};
      final response = await dio.get<dynamic>(
        EndPoints.getPersonalRqsts,
        data: payload,
      );
      if (response is Map<String, dynamic>) {
        return right(PersonalRequestResponse.fromJson(response));
      }
      return left(AppConstants.errMsg);
    } catch (e) {
      return left(AppConstants.errMsg);
    }
  }
}
