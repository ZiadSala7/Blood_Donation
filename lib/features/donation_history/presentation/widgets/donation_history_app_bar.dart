import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class DonationHistoryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DonationHistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        S.of(context).profileDonationHistoryTitle,
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
