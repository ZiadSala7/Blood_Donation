import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../home/data/models/request_model.dart';
import '../widgets/case_details_card.dart';
import '../widgets/header_card.dart';
import '../widgets/progress_card.dart';
import '../widgets/requester_card.dart';
import '../widgets/stats_card.dart';

class RequestDetailsView extends StatelessWidget {
  final RequestModel request;

  const RequestDetailsView({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: const Text('تفاصيل طلب التبرع'),
        centerTitle: true,
        actions: const [Icon(Icons.share), SizedBox(width: 12)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          HeaderCard(request),
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
                children: [StatsCard(request), ProgressCard(request)],
              ),
            ),
          ),
          const SizedBox(height: 12),
          CaseDetailsCard(request),
          const SizedBox(height: 12),
          RequesterCard(request),
          const SizedBox(height: 12),
          CustomButton(onPressed: () {}, label: "تبرّع الآن"),
        ],
      ),
    );
  }
}
