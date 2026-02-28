import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../home/data/models/request_model.dart';
import '../widgets/details_card.dart';
import '../widgets/info_card.dart';
import '../widgets/status_info_display.dart';

class RequestDetailsView extends StatelessWidget {
  final RequestModel model;
  const RequestDetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          StatusInfoDisplay(model: model),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("حالة طارئة – حادث سير", style: AppTextStyles.b28(context)),
            const SizedBox(height: 20),

            /// Request Info
            InfoCard(model: model),
            const SizedBox(height: 16),

            /// Details
            DetailsCard(model: model),
            const Spacer(),

            /// Donate Button (Custom Button)
            SizedBox(
              width: double.infinity,
              height: 56,
              child: CustomButton(
                label: "تبرع الآن",
                onPressed: () {
                  // todo: Handle donate action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
