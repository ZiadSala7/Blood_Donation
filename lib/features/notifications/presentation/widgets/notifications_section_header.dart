import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class NotificationsSectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;
  final EdgeInsetsGeometry padding;

  const NotificationsSectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onActionTap,
    this.padding = const EdgeInsets.fromLTRB(16, 24, 16, 8),
  });

  @override
  Widget build(BuildContext context) {
    final hasAction = actionLabel != null && onActionTap != null;
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment:
              hasAction ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            if (hasAction)
              InkWell(
                onTap: onActionTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 6, color: AppColors.grey),
                    const SizedBox(width: 8),
                    Text(
                      actionLabel!,
                      style: TextStyle(fontSize: 13, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
