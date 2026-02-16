import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/notification_item.dart';
import '../../data/repo/notifications_repo_impl.dart';
import 'notifications_states.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepoImpl repo;

  List<NotificationItem> _todayItems = [];
  List<NotificationItem> _yesterdayItems = [];

  NotificationsCubit(this.repo) : super(NotificationsInitial());

  List<NotificationItem> get todayItems => _todayItems;
  List<NotificationItem> get yesterdayItems => _yesterdayItems;

  Future<void> loadNotifications() async {
    emit(NotificationsLoading());
    final result = await repo.getAllNotifications();
    result.fold((error) => emit(NotificationsError(error)), (items) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(const Duration(days: 1));

      _todayItems = items.where((e) {
        final d = DateTime(
          e.receivedAt.year,
          e.receivedAt.month,
          e.receivedAt.day,
        );
        return d == today;
      }).toList();
      _yesterdayItems = items.where((e) {
        final d = DateTime(
          e.receivedAt.year,
          e.receivedAt.month,
          e.receivedAt.day,
        );
        return d == yesterday;
      }).toList();

      emit(
        NotificationsLoaded(
          todayItems: _todayItems,
          yesterdayItems: _yesterdayItems,
        ),
      );
    });
  }

  Future<void> markAllAsRead() async {
    final result = await repo.markAllAsRead();
    result.fold((_) {}, (_) {
      _todayItems = _todayItems
          .map(
            (e) => NotificationItem(
              id: e.id,
              type: e.type,
              title: e.title,
              body: e.body,
              subtitle: e.subtitle,
              timeAgo: e.timeAgo,
              isRead: true,
              receivedAt: e.receivedAt,
            ),
          )
          .toList();
      _yesterdayItems = _yesterdayItems
          .map(
            (e) => NotificationItem(
              id: e.id,
              type: e.type,
              title: e.title,
              body: e.body,
              subtitle: e.subtitle,
              timeAgo: e.timeAgo,
              isRead: true,
              receivedAt: e.receivedAt,
            ),
          )
          .toList();
      emit(
        NotificationsLoaded(
          todayItems: _todayItems,
          yesterdayItems: _yesterdayItems,
        ),
      );
    });
  }

  Future<void> markAsRead(NotificationItem item) async {
    final result = await repo.markAsRead(item.id);
    result.fold((_) {}, (_) {
      final updated = NotificationItem(
        id: item.id,
        type: item.type,
        title: item.title,
        body: item.body,
        subtitle: item.subtitle,
        timeAgo: item.timeAgo,
        isRead: true,
        receivedAt: item.receivedAt,
      );
      final ti = _todayItems.indexOf(item);
      if (ti >= 0) {
        _todayItems = List.from(_todayItems)..[ti] = updated;
      } else {
        final yi = _yesterdayItems.indexOf(item);
        if (yi >= 0) {
          _yesterdayItems = List.from(_yesterdayItems)..[yi] = updated;
        }
      }
      emit(
        NotificationsLoaded(
          todayItems: _todayItems,
          yesterdayItems: _yesterdayItems,
        ),
      );
    });
  }
}
