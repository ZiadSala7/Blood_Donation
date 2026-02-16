// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/profile_view_model.dart';

class ProfileInfoCard extends StatelessWidget {
  final ProfileViewModel vm;

  const ProfileInfoCard({super.key, required this.vm});

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.edit_outlined, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'بياناتي',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(Icons.more_horiz, color: Colors.grey[600]),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 0.5, color: AppColors.grey2),
            ),
            child: Column(
              children: [
                _buildRow(
                  icon: Icons.phone,
                  iconColor: const Color(0xFF4CAF50),
                  text: vm.phone.isNotEmpty ? vm.phone : '0100 000 0000',
                ),
                const Divider(height: 20),
                _buildRow(
                  icon: Icons.location_on,
                  iconColor: const Color(0xFF2196F3),
                  text: vm.city.isNotEmpty ? vm.city : 'سوهاج، سوهاج',
                ),
                const Divider(height: 20),
                _buildRow(
                  icon: Icons.water_drop,
                  iconColor: const Color(0xFFE53935),
                  text: vm.bloodType,
                ),
                const Divider(height: 20),
                _buildRow(
                  icon: Icons.calendar_today,
                  iconColor: const Color(0xFFE53935),
                  text: vm.formattedLastDonationDate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow({
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
