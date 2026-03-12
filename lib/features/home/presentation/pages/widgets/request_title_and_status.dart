import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/request_status_utils.dart';

class RequestTitleAndStatus extends StatelessWidget {
  final String title;
  final RequestStatusType statusType;
  const RequestTitleAndStatus({
    super.key,
    required this.title,
    required this.statusType,
  });

  @override
  Widget build(BuildContext context) {
    final statusColorValue = statusColor(statusType);
    final statusText = statusLabel(context, statusType);
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title, style: AppTextStyles.b24(context)),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: statusColorValue.withOpacity(
              statusType == RequestStatusType.open ? 0.9 : 0.15,
            ),
            borderRadius: BorderRadius.circular(18),
          ),

          child: Text(
            statusText,
            style: AppTextStyles.r18(context).copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
