import 'package:dartz/dartz.dart';

import '../../data/models/personal_request_response.dart';

abstract class MyRequestsRepo {
  Future<Either<String, PersonalRequestResponse>> getPersonalRequests({
    int pageIndex = 1,
    int pageSize = 50,
  });

  Future<Either<String, String>> confirmRequest({
    required int id,
    required String donorId,
    required int hasDonated,
  });
}
