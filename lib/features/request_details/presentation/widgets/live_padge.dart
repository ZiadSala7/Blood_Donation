import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class LiveBadge extends StatelessWidget {
  const LiveBadge({super.key, required this.scale, required this.opacity});

  final Animation<double> scale;
  final Animation<double> opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xffCFEED4),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: opacity,
            child: ScaleTransition(
              scale: scale,
              child: const Icon(Icons.circle, size: 10, color: Colors.green),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "مباشر",
            style: AppTextStyles.r14(context).copyWith(
              color: Colors.green.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
