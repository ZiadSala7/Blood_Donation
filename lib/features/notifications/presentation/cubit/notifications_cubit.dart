import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/notification_item.dart';
import '../../data/repo/notifications_repo_impl.dart';
import 'notifications_states.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepoImpl repo;

  List<NotificationItem> _todayItems = [];
  List<NotificationItem> _yesterdayItems = [];
  List<NotificationItem> _olderItems = [];

  NotificationsCubit(this.repo) : super(NotificationsInitial());

  List<NotificationItem> get todayItems => _todayItems;
  List<NotificationItem> get yesterdayItems => _yesterdayItems;
  List<NotificationItem> get olderItems => _olderItems;

  Future<void> loadNotifications(BuildContext context) async {
    await _loadNotifications(context, isRefresh: false);
  }

  Future<void> refreshNotifications(BuildContext context) async {
    await _loadNotifications(context, isRefresh: true);
  }

  Future<void> _loadNotifications(
    BuildContext context, {
    required bool isRefresh,
  }) async {
    if (isRefresh) {
      emit(
        NotificationsRefreshing(
          todayItems: _todayItems,
          yesterdayItems: _yesterdayItems,
          olderItems: _olderItems,
        ),
      );
    } else {
      emit(NotificationsLoading());
    }
    final result = await repo.getAllNotifications(context);
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
      _olderItems = items.where((e) {
        final d = DateTime(
          e.receivedAt.year,
          e.receivedAt.month,
          e.receivedAt.day,
        );
        return d != today && d != yesterday;
      }).toList();

      emit(
        NotificationsLoaded(
          todayItems: _todayItems,
          yesterdayItems: _yesterdayItems,
          olderItems: _olderItems,
        ),
      );
    });
  }

  Future<void> markAllAsRead(BuildContext context) async {
    final result = await repo.markAllAsRead();
    await result.fold((_) async {}, (_) async {
      await refreshNotifications(context);
    });
  }

  Future<void> markAsRead(BuildContext context, NotificationItem item) async {
    final result = await repo.markAsRead(item.id);
    await result.fold((_) async {}, (_) async {
      await refreshNotifications(context);
    });
  }
}
