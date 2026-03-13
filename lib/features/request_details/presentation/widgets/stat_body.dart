import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class StatBody extends StatelessWidget {
  final Widget widget;
  final String title, desc;
  final int? value;

  const StatBody(
    this.title,
    this.value, {
    super.key,
    required this.widget,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        widget,
        Text(title, style: const TextStyle(color: Colors.grey)),
        Text(
          '${value ?? 0} $desc',
          style: AppTextStyles.b16(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
