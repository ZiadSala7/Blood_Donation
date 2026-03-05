import 'package:dartz/dartz.dart';

abstract class DonationRepo {
  Future<Either<String, String>> donateTo(int id);
}
