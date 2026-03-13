import 'package:blood_donation/core/errors/exception.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/api_keys.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../generated/l10n.dart';
import '../models/personal_request_response.dart';
import '../../domain/repo/my_requests_repo.dart';

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

  @override
  Future<Either<String, String>> confirmRequest({
    required int id,
    required String donorId,
    required int hasDonated,
  }) async {
    try {
      final response = await dio.patch<dynamic>(
        EndPoints.confirmRqust,
        queryParameters: {
          ApiKeys.requestId: id.toString(),
          ApiKeys.donorId: donorId,
          ApiKeys.hasDonated: hasDonated == 0 ? 'false' : 'true',
        },
      );
      final message =
          _extractMessage(response) ?? S.current.operationSuccessTitle;
      return Right(message);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }

  String? _extractMessage(dynamic response) {
    if (response == null) return null;
    if (response is String) return response;
    if (response is Map<String, dynamic>) {
      return response['message']?.toString() ??
          response['msg']?.toString() ??
          response['data']?.toString();
    }
    return response.toString();
  }
}
