import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

import '../../../../core/api/api_keys.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../domain/repo/add_request_repo.dart';

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
      Location location = Location();
      LocationData data = await location.getLocation();

      final double lat = data.latitude!;
      final double lng = data.longitude!;
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
      return const Right(true);
    } on ServerException catch (e) {
      return Left(
        "${e.errorModel.errorMessage}\n ${e.errorModel.errors.toString()}",
      );
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
      return Right(donationCat);
    } on ServerException catch (e) {
      return Left(
        "${e.errorModel.errorMessage}\n ${e.errorModel.errors.toString()}",
      );
    }
  }
}
