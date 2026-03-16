import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/widgets/custom_buttom_sheet.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/profile_view_model.dart';
import 'profile_menu_tile.dart';

class ProfileMenuSection extends StatelessWidget {
  final ProfileViewModel vm;

  const ProfileMenuSection({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenuTile(
          title: S.of(context).profilePersonalDataTitle,
          icon: Icons.person_outline_rounded,
          onTap: () => context.pushNamed(AppRoutes.personalDataName),
        ),
        const SizedBox(height: 12),
        ProfileMenuTile(
          title: S.of(context).profileDonationHistoryTitle,
          icon: Icons.history_rounded,
          onTap: () => context.pushNamed(AppRoutes.donationHistoryName),
        ),
        const SizedBox(height: 12),
        ProfileMenuTile(
          title: S.of(context).changePass,
          icon: Icons.lock_outline_rounded,
          onTap: () => context.pushNamed(AppRoutes.changePassName),
        ),
        const SizedBox(height: 12),
        ProfileMenuTile(
          title: S.of(context).profileSettingsTitle,
          icon: Icons.tune_rounded,
          onTap: () {},
        ),
        const SizedBox(height: 12),
        ProfileMenuTile(
          title: S.of(context).logoutLabel,
          icon: Icons.logout_rounded,
          iconColor: AppColors.commonClr,
          // Logout uses a confirmation sheet to avoid accidental exits.
          onTap: () => _showLogoutSheet(context, vm),
        ),
      ],
    );
  }
}

void _showLogoutSheet(BuildContext context, ProfileViewModel vm) {
  final parentContext = context;
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => CustomBottomSheetBody(
      message: S.of(context).logoutConfirmMessage,
      onTapYes: () async {
        Navigator.of(sheetContext).pop();
        await vm.logout(parentContext);
      },
    ),
  );
}
