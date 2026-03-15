import 'package:dartz/dartz.dart';

import '../../data/models/donation_history_response.dart';

abstract class DonationHistoryRepo {
  Future<Either<String, DonationHistoryResponse>> getDonationHistory({
    int pageIndex = 1,
    int pageSize = 100,
  });
}
