import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/user_profile_model.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final DioConsumer dio;

  ProfileRepoImpl({required this.dio});

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
}
