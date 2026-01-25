import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class HospitalAndLocationWithIcon extends StatelessWidget {
  final Widget widget;
  final String title;
  const HospitalAndLocationWithIcon({
    super.key,
    required this.widget,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget,
        Text(title, style: AppTextStyles.b14(context)),
      ],
    );
  }
}
