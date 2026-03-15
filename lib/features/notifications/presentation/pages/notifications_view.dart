import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../generated/l10n.dart';
import '../../data/repo/notifications_repo_impl.dart';
import '../cubit/notifications_cubit.dart';
import '../cubit/notifications_states.dart';
import 'widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(
        NotificationsRepoImpl(dio: getIt.get<DioConsumer>()),
      )..loadNotifications(context),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SafeArea(
            child: BlocBuilder<NotificationsCubit, NotificationsState>(
              builder: (context, state) {
                if (state is NotificationsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is NotificationsError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          TextButton.icon(
                            onPressed: () => context
                                .read<NotificationsCubit>()
                                .loadNotifications(context),
                            icon: const Icon(Icons.refresh),
                            label: Text(S.of(context).retryLabel),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (state is NotificationsLoaded) {
                  final items = state;
                  final isEmpty =
                      items.todayItems.isEmpty &&
                      items.yesterdayItems.isEmpty &&
                      items.olderItems.isEmpty;
                  if (isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_none,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            S.of(context).noNotifications,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return NotificationsViewBody(
                    todayItems: items.todayItems,
                    yesterdayItems: items.yesterdayItems,
                    olderItems: items.olderItems,
                    onMarkAllRead: () =>
                        context.read<NotificationsCubit>().markAllAsRead(
                          context,
                        ),
                    onNotificationTap: (item) {
                      context
                          .read<NotificationsCubit>()
                          .markAsRead(context, item);
                      context.pushNamed(
                        AppRoutes.notificationDetailsName,
                        extra: item,
                      );
                    },
                  );
                }
                if (state is NotificationsRefreshing) {
                  final items = state;
                  final isEmpty =
                      items.todayItems.isEmpty &&
                      items.yesterdayItems.isEmpty &&
                      items.olderItems.isEmpty;
                  if (isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_none,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            S.of(context).noNotifications,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return NotificationsViewBody(
                    todayItems: items.todayItems,
                    yesterdayItems: items.yesterdayItems,
                    olderItems: items.olderItems,
                    onMarkAllRead: () =>
                        context.read<NotificationsCubit>().markAllAsRead(
                          context,
                        ),
                    onNotificationTap: (item) {
                      context
                          .read<NotificationsCubit>()
                          .markAsRead(context, item);
                      context.pushNamed(
                        AppRoutes.notificationDetailsName,
                        extra: item,
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
