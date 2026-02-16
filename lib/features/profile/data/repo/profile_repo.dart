import '../models/user_profile_model.dart';

abstract class ProfileRepo {
  Future<UserProfileModel?> getProfile();
}
