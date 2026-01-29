import 'dart:convert';

import '../../features/auth/register/data/models/register_model.dart';
import '../databases/cach_helper.dart';
import '../di/injection.dart';

RegisterModel? getCachedUser() {
  final prefs = getIt.get<CacheHelper>();
  final jsonString = prefs.getString('user');
  if (jsonString == null) {
    return null;
  }

  final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  return RegisterModel.fromJson(jsonMap);
}
