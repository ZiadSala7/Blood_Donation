import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ProfileHeaderAvatar extends StatelessWidget {
  final String bloodType;

  const ProfileHeaderAvatar({super.key, required this.bloodType});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFD4A5A5), width: 3),
          ),
          child: const CircleAvatar(
            backgroundColor: Color(0xFFF5E6E6),
            child: Icon(Icons.person, size: 54, color: Color(0xFFD4A5A5)),
          ),
        ),
        Positioned(
          right: 4,
          bottom: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.commonClr,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              bloodType,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
