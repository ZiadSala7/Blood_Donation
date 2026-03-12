import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home/data/models/request_model.dart';
import '../../../home/presentation/pages/widgets/blood_type_and_needed.dart';

class HeaderCard extends StatelessWidget {
  final RequestModel request;
  const HeaderCard(this.request, {super.key});

  bool _isExpired(DateTime? deadline) {
    if (deadline == null) return false;
    return DateTime.now().isAfter(deadline);
  }

  String _statusText() {
    final total = request.bagsCount ?? 1;
    final collected = request.collectedBags ?? 0;
    final progress = (collected / total).clamp(0.0, 1.0);
    if (_isExpired(request.deadline)) {
      return progress >= 1.0 ? 'مكتمل' : 'مغلق';
    }
    return request.status ?? 'مفتوح';
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'مكتمل':
        return Colors.green;
      case 'مغلق':
        return Colors.grey;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusText = _statusText();
    final statusColor = _statusColor(statusText);

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
                color: statusColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                  Icon(Icons.circle, color: statusColor, size: 10),
                  Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
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
            const SizedBox(height: 12),
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
