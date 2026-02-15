import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

Widget buildProfileHeader() {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Stack(
      children: [
        // Settings button (left)
        Positioned(
          left: 0,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.settings, color: Colors.grey[700]),
            onPressed: () {},
          ),
        ),

        // Next button (right)
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.grey[700]),
            onPressed: () {},
          ),
        ),

        // Profile info (center)
        Center(
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Profile image with blood type badge
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFD4A5A5),
                        width: 3,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xFFF5E6E6),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Color(0xFFD4A5A5),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.commonClr,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'A+',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Name
              const Text(
                'Somaya Asaad',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Blood type row
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 120),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: .5, color: AppColors.grey2),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'A+',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.water_drop,
                      color: AppColors.commonClr,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
