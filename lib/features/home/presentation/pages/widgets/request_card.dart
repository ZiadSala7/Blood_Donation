import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/request_model.dart';
import '../../../domain/entities/request_entity.dart';
import '../../cubit/home_cubit.dart';
import 'blood_type_and_needed.dart';
import 'hospital_and_location_with_icon.dart';
import 'request_deadline.dart';
import 'request_title_and_status.dart';
import 'slider_and_progress_count.dart';

class RequestCard extends StatelessWidget {
  final RequestEntity entity;
  const RequestCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final buttonHeight = (size.shortestSide * 0.06).clamp(
      36.0,
      52.0,
    ); // responsive height

    return Card(
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            /// request title and status of the request (open or close)
            RequestTitleAndStatus(
              title: entity.patientName!,
              status: entity.status!,
            ),

            /// Hospital name and location
            HospitalAndLocationWithIcon(
              widget: const Icon(Symbols.location_city_rounded),
              title: entity.hospitalName!,
            ),
            HospitalAndLocationWithIcon(
              widget: Icon(Icons.location_on_rounded, color: AppColors.grey),
              title: entity.cityAr!,
            ),
            const SizedBox(height: 10),

            /// recieve Blood type and kind of donation
            BloodTypeAndNeeded(
              bldType: entity.requiredBloodType!,
              donationCat: entity.donationCategoryAr!,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  spacing: 5,
                  crossAxisAlignment: .start,
                  children: [
                    SliderAndProgressCount(
                      total: entity.bagsCnt!,
                      collected: entity.collectedBags!,
                    ),
                    RequestDeadline(deadline: entity.deadline!),
                  ],
                ),
                CustomButton(
                  onPressed: () {
                    final cubit = context.read<HomeCubit>();
                    RequestModel model = cubit.allModels.firstWhere(
                      (model) => model.id == entity.id,
                    );
                    context.pushNamed(
                      AppRoutes.requestDetailsName,
                      extra: model,
                    );
                  },
                  label: "عرض المزيد",
                  height: buttonHeight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
