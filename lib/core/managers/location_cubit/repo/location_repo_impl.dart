import 'package:dartz/dartz.dart';

import '../models/town_model.dart';
import '../../../errors/error_model.dart';
import '../../../api/dio_consumer.dart';
import '../../../api/end_points.dart';
import '../../../errors/exception.dart';
import 'location_repo.dart';

class LocationRepoImpl implements LocationRepo {
  final DioConsumer dio;

  LocationRepoImpl({required this.dio});

  /// ================ GetAllGovernorates ========================
  @override
  Future<Either<ErrorModel, List<String>>> getAllGovernorates() async {
    try {
      final response = await dio.get(EndPoints.governorates, data: {});
      List<String> cities = [];
      for (int i = 0; i < response.length; i++) {
        String city = response[i]['NameAr'];
        cities.add(city);
      }
      return Right(cities);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  /// ===================== GetAllTownsInGovernorates =====================
  @override
  Future<Either<ErrorModel, List<TownModel>>> getTownsByGovrnrat(
    num city,
  ) async {
    try {
      final response = await dio.get(
        "${EndPoints.citiesInGovr}$city",
        data: {},
      );
      List<TownModel> cities = [];
      for (int i = 0; i < response.length; i++) {
        TownModel city = TownModel.fromJson(response[i]);
        cities.add(city);
      }
      return Right(cities);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
