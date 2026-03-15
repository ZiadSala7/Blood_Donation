import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/profile_view_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileViewModel vm;

  const ProfileHeader({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.grey[700]),
            onPressed: () => context.go('${AppRoutes.btmNavBar}?tab=0'),
          ),
        ),
        Stack(
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
                  vm.bloodType,
                  style: const TextStyle(
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
        Text(
          vm.name.isNotEmpty ? vm.name : S.of(context).defaultUserName,
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
                vm.bloodType,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
