import 'package:dartz/dartz.dart';

import '../../data/models/donation_response_model.dart';

abstract class DonationRepo {
  Future<Either<String, DonationResponseModel>> donateTo({required int id});
}
