import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../data/repo/profile_repo_impl.dart';
import '../cubit/profile_view_model.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info_card.dart';
import 'widgets/profile_settings_card.dart';
import 'widgets/profile_stats_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(
        repo: ProfileRepoImpl(dio: getIt.get<DioConsumer>()),
      )..loadProfile(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: Consumer<ProfileViewModel>(
              builder: (context, vm, _) {
                if (vm.isLoading && vm.name.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      ProfileHeader(vm: vm),
                      const SizedBox(height: 16),
                      ProfileInfoCard(vm: vm),
                      const SizedBox(height: 16),
                      ProfileStatsCard(vm: vm),
                      const SizedBox(height: 16),
                      ProfileSettingsCard(vm: vm),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
