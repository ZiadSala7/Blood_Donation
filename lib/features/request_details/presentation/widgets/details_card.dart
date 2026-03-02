import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../home/data/models/request_model.dart';

class DetailsCard extends StatelessWidget {
  final RequestModel request;

  const DetailsCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تفاصيل الحالة',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _InfoRow(title: 'اسم المريض', value: request.patientName),
            _InfoRow(title: 'الوصف', value: request.description),
            _InfoRow(
              title: 'آخر موعد',
              value: request.deadline == null
                  ? '-'
                  : DateFormat('dd MMM yyyy').format(request.deadline!),
            ),
            _InfoRow(title: 'المدينة', value: request.cityAr),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String? value;

  const _InfoRow({required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          Expanded(
            child: Text(
              value ?? '-',
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
