import 'package:dartz/dartz.dart';

import '../models/request_model.dart';
import '../../domain/repo/home_repo.dart';
import '../../../../core/api/api_keys.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/constants/app_constants.dart';

class HomeRepoImpl implements HomeRepo {
  final DioConsumer dio;

  HomeRepoImpl({required this.dio});
  @override
  Future<Either<String, RequestModel>> getRequestById({required int id}) async {
    try {
      final response = await dio.get(
        EndPoints.getBldRqustById,
        queryParameters: {'Id': id.toString()},
      );
      final RequestModel requestModel = RequestModel.fromJson(response);
      return Right(requestModel);
    } catch (e) {
      return Left(AppConstants.errMsg);
    }
  }

  @override
  Future<Either<String, List<RequestModel>>> getRequests({
    int pageIndex = 1,
    String? patientName,
    bool? suitableRequests,
    int? sortingOption,
    int? governorateId,
    int? cityId,
  }) async {
    try {
      final Map<String, dynamic> payload = {
        ApiKeys.pageIndex: pageIndex,
        ApiKeys.pageSize: 3,
      };
      if (patientName != null && patientName.trim().isNotEmpty) {
        payload[ApiKeys.search] = patientName.trim();
      }
      if (suitableRequests != null) {
        payload[ApiKeys.suitableRequests] = suitableRequests;
      }
      if (sortingOption != null) {
        payload[ApiKeys.sortingOption] = sortingOption;
      }
      if (governorateId != null) {
        payload[ApiKeys.governorateId] = governorateId;
      }
      if (cityId != null) {
        payload[ApiKeys.cityId] = cityId;
      }

      final response = await dio.get(EndPoints.getBldRqust, data: payload);
      List<RequestModel> models = [];
      for (int i = 0; i < response['data'].length!; i++) {
        RequestModel model = RequestModel.fromJson(response['data'][i]);
        models.add(model);
      }
      return right(models);
    } catch (e) {
      return left(AppConstants.errMsg);
    }
  }
}
