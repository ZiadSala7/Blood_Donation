import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ProgressShimmerBar extends StatelessWidget {
  final double progress;
  final Animation<double> shimmer;

  const ProgressShimmerBar({
    super.key,
    required this.progress,
    required this.shimmer,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = constraints.maxWidth;
        return Stack(
          children: [
            LinearProgressIndicator(
              backgroundColor: AppColors.rqstPrgrsBkgrnd,
              color: AppColors.commonClr,
              value: progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: AnimatedBuilder(
                  animation: shimmer,
                  builder: (context, _) {
                    final shift = -1.0 + (shimmer.value * 2.0);
                    return Container(
                      width: barWidth,
                      height: 8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(shift, 0),
                          end: Alignment(shift + 1.0, 0),
                          colors: const [
                            Colors.transparent,
                            Colors.white54,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
