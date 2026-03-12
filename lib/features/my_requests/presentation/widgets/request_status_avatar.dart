import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class RequestStatusAvatar extends StatelessWidget {
  final String text;
  final Color color;
  final Color statusColor;

  const RequestStatusAvatar({
    super.key,
    required this.text,
    required this.color,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: color,
          child: Text(
            text,
            style: AppTextStyles.b16(context).copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
