import 'package:flutter/material.dart';

import '../../../../core/helper/date_time_helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/data/models/request_model.dart';

class RequesterCard extends StatelessWidget {
  final RequestModel request;
  const RequesterCard(this.request, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(AppAssets.assetsImagesRqustr),
            const SizedBox(width: 15),
            Column(
              spacing: 5,
              crossAxisAlignment: .start,
              children: [
                Text(
                  "ناشر الطلب",
                  style: AppTextStyles.r16(
                    context,
                  ).copyWith(color: AppColors.caseStat),
                ),
                Text(
                  "${request.requesterName}",
                  style: AppTextStyles.b20(context),
                ),
                Text(
                  "تاريخ الطلب . ${formatDateDMYLocale(request.createdAt!, isArabic: false)}",
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Image.asset(AppAssets.assetsImagesPhone),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
