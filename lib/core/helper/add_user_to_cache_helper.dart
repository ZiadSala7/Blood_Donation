import 'dart:convert';

import '../../features/auth/login/presentation/cubit/login_states.dart';
import '../databases/cach_helper.dart';
import '../di/injection.dart';

void addUserToCacheHelper(LoginSuccess state) async {
  final prefs = getIt.get<CacheHelper>();
  prefs.setBool('rememberMe', true);
  final jsonString = jsonEncode(state.model.toJson());
  prefs.setString('user', jsonString);
}
