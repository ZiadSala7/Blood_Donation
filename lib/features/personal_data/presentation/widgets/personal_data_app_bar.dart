import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class PersonalDataAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const PersonalDataAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.text,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.chevron_right, color: AppColors.text),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
