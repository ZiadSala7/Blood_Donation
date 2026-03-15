import 'package:dartz/dartz.dart';

import '../../../profile/data/models/user_profile_model.dart';

abstract class PersonalDataRepo {
  Future<UserProfileModel?> getProfile();

  Future<Either<String, void>> updatePersonalData({
    required String? phoneNumber,
    required int? cityId,
  });
}
