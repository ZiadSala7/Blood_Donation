import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../../core/api/api_keys.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/helper/get_current_location.dart';
import '../../../../../core/helper/get_device_token.dart';
import '../models/register_model.dart';
import '../../domain/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final DioConsumer dio;

  RegisterRepoImpl(this.dio);
  @override
  Future<Either<ErrorModel, RegisterModel>> createAccount({
    required String fullName,
    required String email,
    required num age,
    required num bloodTypeId,
    required num gender,
    required num cityId,
    required String password,
    required String phoneNum,
  }) async {
    try {
      // final position = await getCurrentLocation();

      // double lat = position.latitude;
      // double lng = position.longitude;

      final token = await getDeviceToken();
      final response = await dio.post(
        EndPoints.register,
        data: {
          ApiKeys.email: email,
          ApiKeys.fullName: fullName,
          ApiKeys.bldTypeId: bloodTypeId,
          ApiKeys.age: age,
          ApiKeys.gender: gender,
          ApiKeys.latitude: 26.559074,
          ApiKeys.longitude: 31.695671,
          ApiKeys.cityId: cityId,
          ApiKeys.pass: password,
          ApiKeys.phnNum: phoneNum,
          ApiKeys.deviceTkn: token,
        },
      );
      RegisterModel model = RegisterModel.fromJson(response);
      return Right(model);
    } on ServerException catch (e) {
      log(e.toString());
      return Left(e.errorModel);
    }
  }
}
