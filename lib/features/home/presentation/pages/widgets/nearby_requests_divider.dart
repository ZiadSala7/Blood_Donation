import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class NearbyRequestsDivider extends StatelessWidget {
  const NearbyRequestsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        children: [
          const Expanded(child: Divider()),
          Text(
            "طلبات التبرع القريبة منك",
            style: AppTextStyles.b22(context),
            textAlign: TextAlign.center,
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
