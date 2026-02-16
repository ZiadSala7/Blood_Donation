// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/profile_view_model.dart';
import 'settings_tile.dart';

class ProfileSettingsCard extends StatelessWidget {
  final ProfileViewModel vm;

  const ProfileSettingsCard({super.key, required this.vm});

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
                  Icon(
                    Symbols.notifications_rounded,
                    color: AppColors.commonClr,
                    size: 22,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'إعدادات الإشعارات',
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
                SettingsTile(
                  icon: Symbols.privacy_tip_rounded,
                  iconColor: const Color(0xFF4CAF50),
                  title: 'سياسة الخصوصية',
                  onTap: () {},
                ),
                const Divider(height: 20),
                SettingsTile(
                  icon: Symbols.description_rounded,
                  iconColor: const Color(0xFF4CAF50),
                  title: 'الشروط والأحكام',
                  onTap: () {},
                ),
                const Divider(height: 20),
                SettingsTile(
                  icon: Symbols.logout_rounded,
                  iconColor: Colors.red,
                  title: 'تسجيل الخروج',
                  titleColor: Colors.red,
                  onTap: () => vm.logout(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
