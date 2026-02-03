import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../auth/register/data/models/register_model.dart';

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({super.key, required this.model});

  final RegisterModel model;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      snap: false,
      backgroundColor: Colors.transparent,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      title: Column(
        spacing: 5,
        children: [
          Text(
            '👋أهلا: ${model.name ?? ""}',
            style: AppTextStyles.b24(context),
          ),
          Text(
            '${model.governorateName} : ${model.cityName}',
            style: AppTextStyles.r20(context),
          ),
        ],
      ),
    );
  }
}
