import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ProfileHeaderIdentity extends StatelessWidget {
  final String name;
  final String bloodType;

  const ProfileHeaderIdentity({
    super.key,
    required this.name,
    required this.bloodType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 0.6, color: AppColors.grey2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.water_drop, color: AppColors.commonClr, size: 16),
              const SizedBox(width: 6),
              Text(
                bloodType,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
