import 'package:dio/dio.dart';

import '../databases/cach_helper.dart';
import '../helper/refresh_token_helper.dart';
import 'api_keys.dart';
import 'end_points.dart';

/// Extra key to mark requests that have already been retried after token refresh
const _kRetriedAfterRefresh = 'retried_after_refresh';

class ApiInterceptor extends Interceptor {
  ApiInterceptor({required this.dio});

  final Dio dio;
  final Map<String, CancelToken> _activeRequests = {};

  String _buildRequestKey(RequestOptions options) {
    return "${options.method}_${options.uri.toString()}";
  }

  bool _isAuthEndpoint(String path) {
    final authEndpoints = [
      EndPoints.login,
      EndPoints.register,
      EndPoints.refreshToken,
      EndPoints.forgPass,
      EndPoints.verifyOtp,
      EndPoints.resetPass,
      EndPoints.googleSignIn,
    ];
    return authEndpoints.any((e) => path.contains(e));
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    _handleRequest(options, handler);
  }

  Future<void> _handleRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // For non-auth endpoints, check if token needs refresh before attaching
    if (!_isAuthEndpoint(options.path)) {
      await refreshTokenIfNeeded();
    }

    // Attach auth token for all API calls (e.g. notifications, requests, account)
    final token = CacheHelper().getString(ApiKeys.token);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Generate unique key for this request
    final key = _buildRequestKey(options);

    // Cancel previous request if it exists
    if (_activeRequests.containsKey(key)) {
      _activeRequests[key]?.cancel("Duplicate request");
      _activeRequests.remove(key);
    }

    // Create new CancelToken and assign it to the request
    final cancelToken = CancelToken();
    options.cancelToken = cancelToken;
    _activeRequests[key] = cancelToken;

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final key = _buildRequestKey(response.requestOptions);
    _activeRequests.remove(key);
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final key = _buildRequestKey(err.requestOptions);
    _activeRequests.remove(key);

    // On 401, try to refresh token and retry once
    if (err.response?.statusCode == 401 &&
        err.requestOptions.extra[_kRetriedAfterRefresh] != true &&
        !_isAuthEndpoint(err.requestOptions.path)) {
      err.requestOptions.extra[_kRetriedAfterRefresh] = true;
      _retryAfterRefresh(err, handler);
      return;
    }

    handler.next(err);
  }

  Future<void> _retryAfterRefresh(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final refreshed = await refreshTokenIfNeeded();
    if (!refreshed) {
      handler.next(err);
      return;
    }

    try {
      final response = await dio.fetch(err.requestOptions);
      handler.resolve(response);
    } catch (_) {
      handler.next(err);
    }
  }
}
