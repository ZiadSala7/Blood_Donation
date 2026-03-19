import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/request_status_utils.dart';
import '../../../domain/entities/request_entity.dart';
import 'blood_type_and_needed.dart';
import 'hospital_and_location_with_icon.dart';
import 'request_title_and_status.dart';

class RequestCardDetails extends StatelessWidget {
  final RequestEntity entity;
  final RequestStatusType statusType;

  const RequestCardDetails({
    super.key,
    required this.entity,
    required this.statusType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        /// request title and status of the request (open or close)
        RequestTitleAndStatus(
          title: entity.patientName!,
          statusType: statusType,
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
      ],
    );
  }
}
