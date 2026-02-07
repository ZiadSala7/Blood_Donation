import 'package:dartz/dartz.dart';

import '../../../../core/api/api_keys.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../domain/repo/add_request_repo.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/helper/get_current_location.dart';

class AddRequestRepoImpl implements AddRequestRepo {
  final DioConsumer dio;

  AddRequestRepoImpl({required this.dio});
  @override
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
  }) async {
    try {
      final position = await getCurrentLocation();

      double lat = position.latitude;
      double lng = position.longitude;
      await dio.post(
        EndPoints.createBldRqust,
        data: {
          ApiKeys.patientName: patientName,
          ApiKeys.hospitalName: hospitalName,
          ApiKeys.description: descriptionName,
          ApiKeys.bagsCount: bagsCount,
          ApiKeys.latitude: lat,
          ApiKeys.longitude: lng,
          ApiKeys.donationCategoryId: donationCategoryId,
          ApiKeys.requiredBloodTypeId: requiredBloodTypeId,
          ApiKeys.cityId: cityId,
          ApiKeys.deadline: deadline.toIso8601String(),
          ApiKeys.phoneNumber: phoneNumber,
        },
      );
      return right(true);
    } catch (e) {
      return left(AppConstants.errMsg);
    }
  }

  @override
  Future<Either<String, List<String>>> getDonationCategories() async {
    try {
      final response = await dio.get(EndPoints.donationCat);
      List<String> donationCat = [];
      for (int i = 0; i < response.length!; i++) {
        donationCat.add(response[i]['NameAr']);
      }
      return right(donationCat);
    } catch (e) {
      return left(AppConstants.errMsg);
    }
  }
}
