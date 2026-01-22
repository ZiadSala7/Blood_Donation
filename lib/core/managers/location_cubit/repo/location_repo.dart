import 'package:dartz/dartz.dart';

import '../../../errors/error_model.dart';
import '../models/town_model.dart';

abstract class LocationRepo {
  Future<Either<ErrorModel, List<String>>> getAllGovernorates();
  Future<Either<ErrorModel, List<TownModel>>> getTownsByGovrnrat(num city);
}
