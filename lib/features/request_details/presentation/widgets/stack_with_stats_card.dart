import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../home/data/models/request_model.dart';
import 'live_padge.dart';
import 'stat_body.dart';

class StackWithStatCard extends StatefulWidget {
  const StackWithStatCard({super.key, required this.request});

  final RequestModel request;

  @override
  State<StackWithStatCard> createState() => _StackWithStatCardState();
}

class _StackWithStatCardState extends State<StackWithStatCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _scale = Tween(
      begin: .8,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _opacity = Tween(
      begin: .5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get isOpen {
    final total = widget.request.bagsCount ?? 1;
    final collected = widget.request.collectedBags ?? 0;

    final progress = (collected / total).clamp(0.0, 1.0);

    final isExpired =
        widget.request.deadline != null &&
        DateTime.now().isAfter(widget.request.deadline!);

    return !isExpired && progress < 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        _buildCard(),

        if (isOpen)
          Positioned(
            top: -10,
            child: LiveBadge(scale: _scale, opacity: _opacity),
          ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.rqstRed,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: StatBody(
          S.of(context).onTheWay,
          widget.request.responsesCount,
          widget: Image.asset(AppAssets.assetsImagesComeSoon),
          desc: S.of(context).donorsLabel,
        ),
      ),
    );
  }
}
