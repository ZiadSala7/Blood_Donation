import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/notification_item.dart';
import '../../../data/utils/time_ago_utils.dart';

class NotificationDetailsCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationDetailsCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.rqstGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: AppTextStyles.b20(context)),
          const SizedBox(height: 6),
          Text(
            timeAgoFromDateTime(context, item.receivedAt),
            style: AppTextStyles.r14(
              context,
            ).copyWith(color: AppColors.grey),
          ),
          const SizedBox(height: 12),
          Text(item.body, style: AppTextStyles.r16(context)),
          if (item.subtitle != null && item.subtitle!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              item.subtitle!,
              style: AppTextStyles.s14(
                context,
              ).copyWith(color: AppColors.grey),
            ),
          ],
        ],
      ),
    );
  }
}
