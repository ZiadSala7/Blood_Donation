import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/notifications/api_notification.dart';
import '../models/notification_api_model.dart';
import '../models/notification_item.dart';
import 'notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final DioConsumer dio;

  NotificationsRepoImpl({required this.dio});

  @override
  Future<Either<String, List<NotificationItem>>> getAllNotifications() async {
    try {
      final response = await dio.get<dynamic>(
        EndPoints.getAllNotifications,
        data: {'pageNumber': 1, 'pageSize': 50},
      );
      final list = _extractList(response);
      if (list == null || list.isEmpty) {
        return right([]);
      }
      final items = <NotificationItem>[];
      for (final raw in list) {
        if (raw is! Map<String, dynamic>) continue;
        final normalized = _normalizeNotificationJson(raw);
        try {
          final api = ApiNotification.fromJson(normalized);
          final isRead =
              raw['isRead'] == true ||
              raw['is_read'] == true ||
              raw['read'] == true;
          items.add(notificationItemFromApi(api, isRead: isRead));
        } catch (_) {
          // skip malformed item
        }
      }
      return right(items);
    } catch (e) {
      return left(
        e.toString().contains('Exception') ? e.toString() : AppConstants.errMsg,
      );
    }
  }

  /// API may return List or { data: List }.
  List<dynamic>? _extractList(dynamic response) {
    if (response is List) return response;
    if (response is Map && response['data'] is List) {
      return response['data'] as List<dynamic>;
    }
    return null;
  }

  /// Normalize keys so ApiNotification.fromJson works (e.g. createdAt -> received_at).
  Map<String, dynamic> _normalizeNotificationJson(Map<String, dynamic> raw) {
    final map = Map<String, dynamic>.from(raw);
    final date =
        raw['received_at'] ??
        raw['receivedAt'] ??
        raw['createdAt'] ??
        raw['created_at'] ??
        raw['date'];
    if (date != null && map['received_at'] == null) {
      map['received_at'] = date is String
          ? date
          : (date as DateTime).toIso8601String();
    }
    return map;
  }

  @override
  Future<Either<String, void>> markAsRead(String notificationId) async {
    try {
      await dio.put<void>('${EndPoints.readNotification}$notificationId');
      return right(null);
    } catch (e) {
      return left(
        e.toString().contains('Exception') ? e.toString() : AppConstants.errMsg,
      );
    }
  }

  @override
  Future<Either<String, void>> markAllAsRead() async {
    try {
      await dio.put<void>(EndPoints.readAllNotifications);
      return right(null);
    } catch (e) {
      return left(
        e.toString().contains('Exception') ? e.toString() : AppConstants.errMsg,
      );
    }
  }
}
