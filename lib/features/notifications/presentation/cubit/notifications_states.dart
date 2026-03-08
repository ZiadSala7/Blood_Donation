import '../../data/models/notification_item.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final List<NotificationItem> todayItems;
  final List<NotificationItem> yesterdayItems;
  final List<NotificationItem> olderItems;

  NotificationsLoaded({
    required this.todayItems,
    required this.yesterdayItems,
    required this.olderItems,
  });
}

class NotificationsError extends NotificationsState {
  final String message;

  NotificationsError(this.message);
}
