import 'package:dartz/dartz.dart';

abstract class AddRequestRepo {
  Future<Either<String, bool>> createBloodRequest({
    required String patientName,
    required String descriptionName,
    required String hospitalName,
    required int cityId,
    required int bagsCount,
    required int donationCategoryId,
    required int requiredBloodTypeId,
    required DateTime deadline,
    required String phoneNumber,
  });

  Future<Either<String, List<String>>> getDonationCategories();
}
