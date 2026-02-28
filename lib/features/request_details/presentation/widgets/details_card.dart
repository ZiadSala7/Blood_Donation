import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'detail_row.dart';
import '../../../home/data/models/request_model.dart';

class DetailsCard extends StatelessWidget {
  final RequestModel model;
  const DetailsCard({super.key, required this.model});

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
            DetailRow(title: 'الوصف', value: model.description!),
            const Divider(),
            DetailRow(title: 'مقدم الطلب', value: model.requesterName!),
            const Divider(),
            DetailRow(title: 'رقم الهاتف', value: model.phoneNumber!),
            const Divider(),
            DetailRow(
              title: 'تاريخ الطلب',
              value:
                  "${model.createdAt!.day} ${getMonthName(model.createdAt!)} ${model.createdAt!.year}",
            ),
            const Divider(),
            DetailRow(
              title: 'آخر موعد للتبرع',
              value:
                  "${model.deadline!.day} ${getMonthName(model.deadline!)} ${model.deadline!.year}",
            ),
          ],
        ),
      ),
    );
  }
}

String getMonthName(DateTime date, {String locale = 'ar'}) {
  return DateFormat.MMMM(locale).format(date);
}
