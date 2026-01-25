import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'blood_type_and_needed.dart';
import 'hospital_and_location_with_icon.dart';
import 'request_deadline.dart';
import 'request_title_and_status.dart';
import 'slider_and_progress_count.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            /// request title and status of the request (open or close)
            const RequestTitleAndStatus(),

            /// Hospital name and location
            const HospitalAndLocationWithIcon(
              widget: Icon(Symbols.location_city_rounded),
              title: "مستشفى ابن سينا ",
            ),
            HospitalAndLocationWithIcon(
              widget: Icon(Icons.location_on_rounded, color: AppColors.grey),
              title: "سوهاج",
            ),
            const SizedBox(height: 10),

            /// recieve Blood type and kind of donation
            const BloodTypeAndNeeded(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                const Column(
                  spacing: 5,
                  crossAxisAlignment: .start,
                  children: [SliderAndProgressCount(), RequestDeadline()],
                ),
                CustomButton(onPressed: () {}, label: "تبرع الاّن"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
