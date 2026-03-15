import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../notifications/data/utils/time_ago_utils.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/personal_request_response.dart';
import '../cubit/my_requests_cubit.dart';
import 'request_status_card.dart';

class RequestResponsesList extends StatelessWidget {
  final PersonalRequestItem item;

  const RequestResponsesList({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    if (item.responses.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(S.of(context).noResponsesYet),
      );
    }
    return Column(
      children: item.responses.map((r) {
        final timeText = r.createdAt != null
            ? timeAgoFromDateTime(context, r.createdAt!)
            : S.of(context).timeAgoNow;
        final avatarColor = r.avatarColorHex != null
            ? _hexToColor(r.avatarColorHex!)
            : AppColors.commonClr;
        final canUpdate =
            item.request.id != null &&
            r.donorId != null &&
            r.donorId!.isNotEmpty;
        final isConfirmedOverride = canUpdate &&
            context.read<MyRequestsCubit>().isConfirmed(
                  item.request.id!,
                  r.donorId!,
                );
        return RequestStatusCard(
          name: r.name,
          statusType: r.statusType,
          time: timeText,
          avatarText: r.avatarText ?? S.of(context).defaultAvatarInitial,
          avatarColor: avatarColor,
          donorId: r.donorId,
          forceCompleted: isConfirmedOverride,
          onAccept: canUpdate
              ? () => context.read<MyRequestsCubit>().confirmRequest(
                  requestId: item.request.id!,
                  donorId: r.donorId!,
                  hasDonated: 1,
                )
              : null,
          onReject: canUpdate
              ? () => context.read<MyRequestsCubit>().confirmRequest(
                  requestId: item.request.id!,
                  donorId: r.donorId!,
                  hasDonated: 0,
                )
              : null,
        );
      }).toList(),
    );
  }

  Color _hexToColor(String hex) {
    final cleaned = hex.replaceAll('#', '');
    final value = int.tryParse(
      cleaned.length == 6 ? 'FF$cleaned' : cleaned,
      radix: 16,
    );
    return value != null ? Color(value) : AppColors.commonClr;
  }
}
