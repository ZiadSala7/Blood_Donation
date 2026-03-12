import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../models/notification_item.dart';

abstract class NotificationsRepo {
  Future<Either<String, List<NotificationItem>>> getAllNotifications(BuildContext context);
  Future<Either<String, void>> markAsRead(String notificationId);
  Future<Either<String, void>> markAllAsRead();
}
