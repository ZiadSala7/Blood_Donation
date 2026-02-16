import 'package:dartz/dartz.dart';

import '../models/notification_item.dart';

abstract class NotificationsRepo {
  Future<Either<String, List<NotificationItem>>> getAllNotifications();
  Future<Either<String, void>> markAsRead(String notificationId);
  Future<Either<String, void>> markAllAsRead();
}
