import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/request_model.dart';
import '../../../domain/entities/request_entity.dart';
import '../../cubit/home_cubit.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key, required this.entity});

  final RequestEntity entity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final cubit = context.read<HomeCubit>();
        final RequestModel model = cubit.allModels.firstWhere(
          (model) => model.id == entity.id,
        );
        context.pushNamed(AppRoutes.requestDetailsName, extra: model);
      },
      child: Text(
        "عرض المزيد",
        style: AppTextStyles.b16(context).copyWith(color: AppColors.grey2),
      ),
    );
  }
}
