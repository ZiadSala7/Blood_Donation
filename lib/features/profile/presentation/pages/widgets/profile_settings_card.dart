import 'package:flutter/material.dart';

class ProfileSettingsCard extends StatelessWidget {
  const ProfileSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(title: Text('سياسة الخصوصية')),
          ListTile(title: Text('الشروط والأحكام')),
          ListTile(
            title: Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
