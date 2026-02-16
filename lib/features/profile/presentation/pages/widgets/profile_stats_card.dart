import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/profile_view_model.dart';

class ProfileStatsCard extends StatelessWidget {
  final ProfileViewModel vm;

  const ProfileStatsCard({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Symbols.notifications_rounded,
                      color: AppColors.commonClr, size: 22),
                  SizedBox(width: 8),
                  Text(
                    'نشاطي',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(Icons.more_horiz, color: Colors.grey[600]),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StatSubCard(
                  gradient: const [
                    Color(0xFFE53935),
                    Color(0xFFF48FB1),
                  ],
                  icon: Symbols.water_drop_rounded,
                  title: 'مرات التبرع',
                  value: vm.donationsCount.toString(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatSubCard(
                  gradient: const [
                    Color(0xFF42A5F5),
                    Color(0xFF90CAF9),
                  ],
                  icon: Symbols.favorite_rounded,
                  title: 'حالات المساعدة',
                  value: vm.requestsCount.toString(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _getMotivationalMessage(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  String _getMotivationalMessage() {
    if (vm.donationsCount >= 3 || vm.requestsCount >= 3) {
      return 'أنت متبرع مميز، بارك الله فيك ووفقك لعمل الخير دائماً.';
    }
    if (vm.donationsCount > 0 || vm.requestsCount > 0) {
      return 'شكراً لمساهمتك في إنقاذ حياة الآخرين.';
    }
    return 'ابدأ رحلتك في العطاء وساهم في إنقاذ حياة.';
  }
}

class _StatSubCard extends StatelessWidget {
  final List<Color> gradient;
  final IconData icon;
  final String title;
  final String value;

  const _StatSubCard({
    required this.gradient,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.first.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
