import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../core/utils/app_text_styles.dart';

class MyRequestsEmptyState extends StatelessWidget {
  const MyRequestsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).noRequestsYet,
        style: AppTextStyles.r16(context),
      ),
    );
  }
}
