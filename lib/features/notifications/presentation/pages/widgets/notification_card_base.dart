import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

/// Base card for all notification types. Used by the five custom notification widgets.
class NotificationCardBase extends StatelessWidget {
  final Widget icon;
  final Color iconBackgroundColor;
  final String title;
  final String body;
  final String? subtitle;
  final String timeAgo;
  final bool isRead;
  final Color? cardColor;
  final VoidCallback? onTap;

  const NotificationCardBase({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.body,
    this.subtitle,
    required this.timeAgo,
    this.isRead = false,
    this.cardColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor ?? AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: icon,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      body,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.text,
                        height: 1.35,
                      ),
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isRead ? AppColors.grey2 : AppColors.commonClr,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
