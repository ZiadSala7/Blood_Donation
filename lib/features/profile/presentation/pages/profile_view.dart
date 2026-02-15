import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      create: (_) => ProfileViewModel()..loadProfile(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Consumer<ProfileViewModel>(
            builder: (context, vm, _) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    buildProfileHeader(),
                    const SizedBox(height: 16),
                    const ProfileInfoCard(),
                    const SizedBox(height: 16),
                    ProfileStatsCard(vm: vm),
                    const SizedBox(height: 16),
                    const ProfileSettingsCard(),
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
