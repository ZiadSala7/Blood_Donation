import 'dart:convert';

import '../api/api_keys.dart';
import '../api/dio_consumer.dart';
import '../api/end_points.dart';
import '../databases/cach_helper.dart';
import '../di/injection.dart';
import '../errors/exception.dart';
import '../../features/auth/register/data/models/register_model.dart';
import 'get_user.dart';

/// Returns true if [refreshTokenExpiration] is expired or null.
/// Optionally pass [bufferMinutes] to consider expired a few minutes before.
bool isRefreshTokenExpired(
  DateTime? refreshTokenExpiration, {
  int bufferMinutes = 0,
}) {
  if (refreshTokenExpiration == null) return true;
  return DateTime.now().add(Duration(minutes: bufferMinutes)).isAfter(
        refreshTokenExpiration,
      );
}

/// Checks if the cached refresh token is expired. If so, calls the refresh
/// endpoint, updates the cached token and user data, and returns true.
/// Returns false if not expired, no cached user, or refresh fails.
Future<bool> refreshTokenIfNeeded() async {
  final cachedUser = getCachedUser();
  if (cachedUser == null) return false;

  final token = cachedUser.token;
  final refreshToken = cachedUser.refreshToken;
  if (token == null ||
      token.isEmpty ||
      refreshToken == null ||
      refreshToken.isEmpty) {
    return false;
  }

  if (!isRefreshTokenExpired(cachedUser.refreshTokenExpiration)) {
    return false; // Not expired, nothing to do
  }

  try {
    final dio = getIt.get<DioConsumer>();
    final response = await dio.post(
      EndPoints.refreshToken,
      data: {
        ApiKeys.token: token,
        ApiKeys.refreshToken: refreshToken,
      },
    );

    final data = Map<String, dynamic>.from(response);
    final newToken = data['token'] as String?;
    final newRefreshToken = data['refreshToken'] as String?;
    final rawExpiration = data['refreshTokenExpiration'];

    DateTime? newRefreshTokenExpiration;
    if (rawExpiration is DateTime) {
      newRefreshTokenExpiration = rawExpiration;
    } else if (rawExpiration is String) {
      newRefreshTokenExpiration = DateTime.tryParse(rawExpiration);
    }

    if (newToken == null ||
        newToken.isEmpty ||
        newRefreshToken == null ||
        newRefreshTokenExpiration == null) {
      return false;
    }

    // Update cached token
    final prefs = getIt.get<CacheHelper>();
    await prefs.setString(ApiKeys.token, newToken);

    // Update cached user with new token data
    final updatedUser = RegisterModel(
      token: newToken,
      name: cachedUser.name,
      email: cachedUser.email,
      cityName: cachedUser.cityName,
      governorateName: cachedUser.governorateName,
      refreshToken: newRefreshToken,
      refreshTokenExpiration: newRefreshTokenExpiration,
    );
    final jsonString = jsonEncode(updatedUser.toJson());
    await prefs.setString('user', jsonString);

    return true;
  } on ServerException {
    return false;
  }
}
