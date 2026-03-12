import 'package:flutter/material.dart';

import '../../../home/data/models/request_model.dart';
import 'progress_deadline_row.dart';
import 'progress_header_row.dart';
import 'progress_shimmer_bar.dart';

class ProgressCard extends StatefulWidget {
  final RequestModel request;
  const ProgressCard(this.request, {super.key});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmerController;

  bool _isExpired(DateTime? deadline) {
    if (deadline == null) return false;
    return DateTime.now().isAfter(deadline);
  }

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.request.bagsCount ?? 1;
    final collected = widget.request.collectedBags ?? 0;
    final progress = (collected / total).clamp(0.0, 1.0);
    final isExpired = _isExpired(widget.request.deadline);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressHeaderRow(
            collectedBags: widget.request.collectedBags,
            bagsCount: widget.request.bagsCount,
            progress: progress,
          ),
          const SizedBox(height: 8),
          ProgressShimmerBar(progress: progress, shimmer: _shimmerController),
          const SizedBox(height: 8),
          ProgressDeadlineRow(
            isExpired: isExpired,
            deadline: widget.request.deadline,
          ),
        ],
      ),
    );
  }
}
