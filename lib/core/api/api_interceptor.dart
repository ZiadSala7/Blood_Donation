import 'package:dio/dio.dart';

import '../databases/cach_helper.dart';
import 'api_keys.dart';

class ApiInterceptor extends Interceptor {
  final Map<String, CancelToken> _activeRequests = {};

  String _buildRequestKey(RequestOptions options) {
    return "${options.method}_${options.uri.toString()}";
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
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
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final key = _buildRequestKey(err.requestOptions);
    _activeRequests.remove(key);
    handler.next(err);
  }
}
