import 'package:dartz/dartz.dart';

import '../../../../../core/helper/get_device_token.dart';
import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/api_keys.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exception.dart';
import '../../../register/data/models/register_model.dart';
import '../../domain/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final DioConsumer dio;
  LoginRepoImpl(this.dio);
  @override
  Future<Either<ErrorModel, RegisterModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final token = await getDeviceToken();
      final response = await dio.post(
        EndPoints.login,
        data: {
          ApiKeys.email: email,
          ApiKeys.pass: password,
          ApiKeys.deviceTkn: token,
        },
      );
      RegisterModel model = RegisterModel.fromJson(response);
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
