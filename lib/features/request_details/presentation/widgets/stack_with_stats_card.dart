import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/data/models/request_model.dart';
import 'stat_body.dart';

class StackWithStatCard extends StatelessWidget {
  const StackWithStatCard({super.key, required this.request});

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.rqstRed,
          ),
          child: StatBody(
            "في الطريق",
            request.collectedBags,
            widget: Image.asset(AppAssets.assetsImagesComeSoon),
            desc: 'متبرعين',
          ),
        ),
        Positioned(
          top: 0,
          left: 20,
          right: 20,
          child: Container(
            height: 20,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              spacing: 10,
              children: [
                const Icon(Icons.circle, color: Colors.green, size: 10),
                Text("مباشر", style: AppTextStyles.r16(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
