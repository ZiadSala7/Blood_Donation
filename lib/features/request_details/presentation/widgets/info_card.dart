import 'package:flutter/material.dart';

import '../../../home/data/models/request_model.dart';
import 'blood_type_and_donation_cat.dart';
import 'hospital_and_location.dart';

class InfoCard extends StatelessWidget {
  final RequestModel model;
  const InfoCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Hospital & Location
            HospitalAndLocation(model: model),

            const SizedBox(height: 16),

            /// Blood Type
            BloodTypeAndDonationCat(model: model),

            const SizedBox(height: 16),

            /// Progress
            Text('مطلوب ${model.bagsCount} متبرعين'),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.4,
              backgroundColor: Colors.grey.shade300,
              color: Colors.red,
            ),
            const SizedBox(height: 4),
            Text(
              'تم ${model.responsesCount} من ${model.bagsCount}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
