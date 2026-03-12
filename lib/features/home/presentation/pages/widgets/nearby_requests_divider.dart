import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class NearbyRequestsDivider extends StatelessWidget {
  const NearbyRequestsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: .start,
        crossAxisAlignment: .end,
        children: [
          const Expanded(child: Divider(indent: 16)),
          Text(
            S.of(context).nearbyRequestsTitle,
            style: AppTextStyles.b22(context),
            textAlign: TextAlign.center,
          ),
          const Expanded(child: Divider(endIndent: 16)),
        ],
      ),
    );
  }
}
