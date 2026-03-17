import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/notification_item.dart';
import 'notification_details_card.dart';

class NotificationDetailsBody extends StatelessWidget {
  final NotificationItem item;
  final bool isLoading;
  final VoidCallback onOpenRequest;

  const NotificationDetailsBody({
    super.key,
    required this.item,
    required this.isLoading,
    required this.onOpenRequest,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        NotificationDetailsCard(item: item),
        if (item.type == NotificationCardType.bloodRequest) ...[
          const SizedBox(height: 16),
          CustomButton(
            onPressed: isLoading ? null : onOpenRequest,
            label: S.of(context).donateNow,
            height: 44,
          ),
        ],
      ],
    );
  }
}
