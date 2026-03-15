import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cubit/profile_view_model.dart';
import 'profile_menu_section.dart';
import 'profile_header.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
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
              ProfileMenuSection(vm: vm),
            ],
          ),
        );
      },
    );
  }
}
