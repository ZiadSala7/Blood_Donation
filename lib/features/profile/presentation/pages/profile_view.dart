import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/custom_buttom_sheet.dart';
import '../../../../generated/l10n.dart';
import '../../data/repo/profile_repo_impl.dart';
import '../cubit/profile_view_model.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menu_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ProfileViewModel(repo: ProfileRepoImpl(dio: getIt.get<DioConsumer>()))
            ..loadProfile(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Consumer<ProfileViewModel>(
            builder: (context, vm, _) {
              if (vm.isLoading && vm.name.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Column(
                  children: [
                    ProfileHeader(vm: vm),
                    const SizedBox(height: 16),
                    ProfileMenuTile(
                      title: S.of(context).profilePersonalDataTitle,
                      icon: Icons.person_outline_rounded,
                      onTap: () =>
                          context.pushNamed(AppRoutes.personalDataName),
                    ),
                    const SizedBox(height: 12),
                    ProfileMenuTile(
                      title: S.of(context).profileDonationHistoryTitle,
                      icon: Icons.history_rounded,
                      onTap: () =>
                          context.pushNamed(AppRoutes.donationHistoryName),
                    ),
                    const SizedBox(height: 12),
                    ProfileMenuTile(
                      title: S.of(context).changePass,
                      icon: Icons.lock_outline_rounded,
                      onTap: () => context.pushNamed(AppRoutes.changePassName),
                    ),
                    const SizedBox(height: 12),
                    ProfileMenuTile(
                      title: S.of(context).logoutLabel,
                      icon: Icons.logout_rounded,
                      iconColor: AppColors.commonClr,
                      onTap: () => _showLogoutSheet(context, vm),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
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
