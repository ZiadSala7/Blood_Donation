import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../notifications/data/utils/time_ago_utils.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/personal_request_response.dart';
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
        return RequestStatusCard(
          name: r.name,
          statusType: r.statusType,
          time: timeText,
          avatarText: r.avatarText ?? S.of(context).defaultAvatarInitial,
          avatarColor: avatarColor,
          donorId: r.donorId,
          onAccept: () {},
          onReject: () {},
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
