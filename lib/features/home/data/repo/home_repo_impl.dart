import 'package:blood_donation/core/api/dio_consumer.dart';
import 'package:blood_donation/features/home/data/models/request_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/api/api_keys.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DioConsumer dio;

  HomeRepoImpl({required this.dio});
  @override
  Future<Either<String, RequestModel>> getRequestById({required int id}) {
    // TODO: implement getRequestById
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<RequestModel>>> getRequests({
    int pageIndex = 1,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.getBldRqust,
        data: {ApiKeys.pageIndex: pageIndex, ApiKeys.pageSize: 5},
      );
      List<RequestModel> models = [];
      for (int i = 0; i < response['items'].length!; i++) {
        RequestModel model = RequestModel.fromJson(response['items'][i]);
        models.add(model);
      }
      return right(models);
    } catch (e) {
      return left(AppConstants.errMsg);
    }
  }
}
