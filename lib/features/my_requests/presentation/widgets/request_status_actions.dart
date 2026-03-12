import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class RequestStatusActions extends StatelessWidget {
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const RequestStatusActions({super.key, this.onAccept, this.onReject});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ActionCircle(
          icon: Icons.close,
          color: AppColors.grey,
          bgColor: AppColors.greyInCard,
          onTap: onReject,
        ),
        const SizedBox(width: 8),
        _ActionCircle(
          icon: Icons.check,
          color: Colors.green,
          // ignore: deprecated_member_use
          bgColor: Colors.green.withOpacity(0.15),
          onTap: onAccept,
        ),
      ],
    );
  }
}

class _ActionCircle extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bgColor;
  final VoidCallback? onTap;

  const _ActionCircle({
    required this.icon,
    required this.color,
    required this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}
