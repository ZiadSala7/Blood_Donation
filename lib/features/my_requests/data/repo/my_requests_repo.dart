import 'package:dartz/dartz.dart';

import '../models/personal_request_response.dart';

abstract class MyRequestsRepo {
  Future<Either<String, PersonalRequestResponse>> getPersonalRequests({
    int pageIndex = 1,
    int pageSize = 5,
  });
}
