import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class SliderAndProgressCount extends StatefulWidget {
  final int total, collected;
  const SliderAndProgressCount({
    super.key,
    required this.total,
    required this.collected,
  });

  @override
  State<SliderAndProgressCount> createState() => _SliderAndProgressCountState();
}

class _SliderAndProgressCountState extends State<SliderAndProgressCount> {
  @override
  Widget build(BuildContext context) {
    double progress = widget.collected / widget.total;
    return Row(
      spacing: 16,
      children: [
        Text(
          S.of(context).collectedBagsCount(widget.collected, widget.total),
          style: AppTextStyles.b16(context),
        ),
        SizedBox(
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress, // we put a progress here
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
