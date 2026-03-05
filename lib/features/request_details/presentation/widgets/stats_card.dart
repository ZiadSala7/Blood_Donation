import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/data/models/request_model.dart';
import 'stack_with_stats_card.dart';
import 'stat_body.dart';

class StatsCard extends StatelessWidget {
  final RequestModel request;
  const StatsCard(this.request, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.rqstGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: StatBody(
                'المطلوب',
                request.bagsCount,
                widget: Image.asset(AppAssets.assetsImagesMatlop),
                desc: 'متبرعين',
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.rqstGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: StatBody(
                'تم وصول',
                request.responsesCount,
                widget: Image.asset(AppAssets.assetsImagesArriveDone),
                desc: 'متبرعين',
              ),
            ),
          ),
        ),
        Flexible(flex: 1, child: StackWithStatCard(request: request)),
      ],
    );
  }
}
