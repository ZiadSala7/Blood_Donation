import 'package:dartz/dartz.dart';

import '../../data/models/request_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<RequestModel>>> getRequests({
    int pageIndex = 1,
    String? patientName,
    bool? suitableRequests,
    int? sortingOption,
    int? governorateId,
    int? cityId,
  });
  Future<Either<String, RequestModel>> getRequestById({required int id});
}
