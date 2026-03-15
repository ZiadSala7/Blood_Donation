import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exception.dart';
import '../../../profile/data/models/user_profile_model.dart';
import '../../domain/repo/personal_data_repo.dart';

class PersonalDataRepoImpl implements PersonalDataRepo {
  final DioConsumer dio;

  PersonalDataRepoImpl({required this.dio});

  @override
  Future<UserProfileModel?> getProfile() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        EndPoints.getUserProfile,
      );
      return UserProfileModel.fromJson(response);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Either<String, void>> updatePersonalData({
    required String? phoneNumber,
    required int? cityId,
  }) async {
    try {
      final payload = <String, dynamic>{};
      if (phoneNumber != null && phoneNumber.trim().isNotEmpty) {
        payload['phoneNumber'] = phoneNumber.trim();
      }
      if (cityId != null) {
        payload['cityId'] = cityId;
      }
      await dio.put<void>(EndPoints.updateAccProfile, data: payload);
      return right(null);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage ?? AppConstants.errMsg);
    } catch (_) {
      return left(AppConstants.errMsg);
    }
  }
}
