import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../request_details/presentation/widgets/header_card.dart';
import '../../../request_details/presentation/widgets/progress_card.dart';
import '../../../request_details/presentation/widgets/stats_card.dart';
import '../../data/models/personal_request_response.dart';

class MyRequestsRequestDetailsSection extends StatelessWidget {
  final PersonalRequestItem item;

  const MyRequestsRequestDetailsSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCard(item.request),
        const SizedBox(height: 12),
        Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 15,
              children: [
                StatsCard(item.request),
                ProgressCard(item.request),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
