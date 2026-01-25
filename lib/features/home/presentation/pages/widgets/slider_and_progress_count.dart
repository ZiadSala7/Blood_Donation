import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class SliderAndProgressCount extends StatelessWidget {
  const SliderAndProgressCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Text("تم 2 من 5", style: AppTextStyles.b16(context)),
        SizedBox(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: .5, // we put a progress here
              minHeight: 5,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation(Color(0xFFB11D1D)),
            ),
          ),
        ),
      ],
    );
  }
}
