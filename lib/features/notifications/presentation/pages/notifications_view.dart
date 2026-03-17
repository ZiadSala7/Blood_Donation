import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/app_routes.dart';
import '../../data/repo/notifications_repo_impl.dart';
import '../../data/models/notification_item.dart';
import '../cubit/notifications_cubit.dart';
import '../cubit/notifications_states.dart';
import '../widgets/notifications_empty_state.dart';
import '../widgets/notifications_error_state.dart';
import '../widgets/notifications_loaded_content.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(
        NotificationsRepoImpl(dio: getIt.get<DioConsumer>()),
      )..loadNotifications(context),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              /// ========== loading state notificatoin ======
              if (state is NotificationsLoading) {
                return const Center(child: CircularProgressIndicator());

                /// ========== error state =================
              }
              if (state is NotificationsError) {
                return NotificationsErrorState(
                  message: state.message,
                  onRetry: () => context
                      .read<NotificationsCubit>()
                      .loadNotifications(context),
                );
              }

              /// ========== data got notifications ========
              if (state is NotificationsLoaded) {
                final content = NotificationsLoadedContent(
                  todayItems: state.todayItems,
                  yesterdayItems: state.yesterdayItems,
                  olderItems: state.olderItems,
                  onMarkAllRead: () =>
                      context.read<NotificationsCubit>().markAllAsRead(context),
                  onNotificationTap: (NotificationItem item) {
                    context.read<NotificationsCubit>().markAsRead(
                      context,
                      item,
                    );
                    context.pushNamed(
                      AppRoutes.notificationDetailsName,
                      extra: item,
                    );
                  },
                );
                if (content.isEmpty) {
                  return const NotificationsEmptyState();
                }
                return content;
              }

              /// =========== refresh notification ==========
              if (state is NotificationsRefreshing) {
                final content = NotificationsLoadedContent(
                  todayItems: state.todayItems,
                  yesterdayItems: state.yesterdayItems,
                  olderItems: state.olderItems,
                  onMarkAllRead: () =>
                      context.read<NotificationsCubit>().markAllAsRead(context),
                  onNotificationTap: (NotificationItem item) {
                    context.read<NotificationsCubit>().markAsRead(
                      context,
                      item,
                    );
                    context.pushNamed(
                      AppRoutes.notificationDetailsName,
                      extra: item,
                    );
                  },
                );
                if (content.isEmpty) {
                  return const NotificationsEmptyState();
                }
                return content;
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
