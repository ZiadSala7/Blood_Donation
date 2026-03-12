import 'package:flutter/material.dart';

import '../../../../core/helper/date_time_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/data/models/request_model.dart';

class ProgressCard extends StatelessWidget {
  final RequestModel request;
  const ProgressCard(this.request, {super.key});

  bool _isExpired(DateTime? deadline) {
    if (deadline == null) return false;
    return DateTime.now().isAfter(deadline);
  }

  @override
  Widget build(BuildContext context) {
    final total = request.bagsCount ?? 1;
    final collected = request.collectedBags ?? 0;
    final progress = (collected / total).clamp(0.0, 1.0);
    final isExpired = _isExpired(request.deadline);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "تم ${request.collectedBags} من ${request.bagsCount}",
                style: AppTextStyles.r16(
                  context,
                ).copyWith(color: AppColors.commonClr),
              ),
              Text(
                'اكتمال الطلب'
                ' '
                '${(progress * 100).toInt()}%',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            backgroundColor: AppColors.rqstPrgrsBkgrnd,
            color: AppColors.commonClr,
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.timer_outlined,
                color: isExpired ? AppColors.caseStat : null,
              ),
              if (isExpired) ...[
                Text(
                  'لم تعد الحالة تستقبل الطلبات',
                  style: AppTextStyles.b16(
                    context,
                  ).copyWith(color: AppColors.caseStat),
                ),
              ] else ...[
                Text('اخر موعد للتبرع : ', style: AppTextStyles.b16(context)),

                /// here we will put the deadline of the request
                Text(
                  ' ${request.deadline!.day} ${getMonthName(request.deadline!)} ',
                  style: AppTextStyles.s16(
                    context,
                  ).copyWith(color: AppColors.commonClr),
                ),

                /// here we will put a note to remind with the deadline remaining
                Text(
                  '(ينتهي خلال ${daysBetween(DateTime.now(), request.deadline!)} أيام)',
                  style: AppTextStyles.r16(
                    context,
                  ).copyWith(color: AppColors.commonClr),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
