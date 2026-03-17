import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../generated/l10n.dart';
import '../../../home/data/repo/home_repo_impl.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../data/models/notification_item.dart';
import 'widgets/notification_details_body.dart';

class NotificationDetailsView extends StatefulWidget {
  final NotificationItem item;
  const NotificationDetailsView({super.key, required this.item});

  @override
  State<NotificationDetailsView> createState() =>
      _NotificationDetailsViewState();
}

class _NotificationDetailsViewState extends State<NotificationDetailsView> {
  bool _isLoading = false;

  Future<void> _handleOpenRequest(BuildContext blocContext) async {
    if (_isLoading) return;
    final requestId = widget.item.bloodRequestId;
    if (requestId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(S.of(context).genericErrorRetry)));
      return;
    }

    setState(() => _isLoading = true);
    int id = int.parse(requestId);
    final result = await blocContext.read<HomeCubit>().getRequestById(id: id);
    if (!mounted) return;
    setState(() => _isLoading = false);

    result.fold(
      (err) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(err))),
      (model) => context.pushNamed(AppRoutes.requestDetailsName, extra: model),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepoImpl(dio: getIt.get<DioConsumer>())),
      child: Builder(
        builder: (blocContext) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              scrolledUnderElevation: 0,
              title: Text(S.of(context).notificationDetailsTitle),
              centerTitle: true,
            ),
            body: NotificationDetailsBody(
              item: widget.item,
              isLoading: _isLoading,
              onOpenRequest: () => _handleOpenRequest(blocContext),
            ),
          );
        },
      ),
    );
  }
}
