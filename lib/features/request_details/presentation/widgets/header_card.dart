import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/request_status_utils.dart';
import '../../../home/data/models/request_model.dart';
import '../../../home/presentation/pages/widgets/blood_type_and_needed.dart';

class HeaderCard extends StatelessWidget {
  final RequestModel request;
  const HeaderCard(this.request, {super.key});

  @override
  Widget build(BuildContext context) {
    final statusType = resolveRequestStatus(
      deadline: request.deadline,
      total: request.bagsCount ?? 1,
      collected: request.collectedBags ?? 0,
      status: request.status,
    );
    final statusText = statusLabel(context, statusType);
    final statusTint = statusColor(statusType);

    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 40,
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: statusTint.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                  Icon(Icons.circle, color: statusTint, size: 10),
                  Text(
                    statusText,
                    style: TextStyle(
                      color: statusText == 'مفتوح' ? Colors.green : statusTint,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              request.patientName ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.local_hospital, size: 16),
                const SizedBox(width: 4),
                Text(request.hospitalName ?? ''),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: AppColors.grey,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(request.cityAr ?? ''),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: .center,
              children: [
                BloodTypeAndNeeded(
                  isRequest: true,
                  bldType: request.requiredBloodType!,
                  donationCat: request.donationCategoryAr!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
