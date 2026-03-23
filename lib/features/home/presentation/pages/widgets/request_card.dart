import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/request_status_utils.dart';
import '../../../domain/entities/request_entity.dart';
import 'request_card_actions.dart';
import 'request_card_details.dart';

class RequestCard extends StatelessWidget {
  final RequestEntity entity;
  final Future<void> Function()? onRefresh;
  const RequestCard({super.key, required this.entity, this.onRefresh});

  RequestStatusType _displayStatusType() {
    return resolveRequestStatus(
      deadline: entity.deadline,
      total: entity.bagsCnt ?? 1,
      collected: entity.collectedBags ?? 0,
      status: entity.status,
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusType = _displayStatusType();

    return Card(
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            RequestCardDetails(entity: entity, statusType: statusType),
            const SizedBox(height: 15),
            RequestCardActions(
              entity: entity,
              statusType: statusType,
              onRefresh: onRefresh,
            ),
          ],
        ),
      ),
    );
  }
}
