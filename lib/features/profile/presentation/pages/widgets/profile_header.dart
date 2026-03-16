import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../cubit/profile_view_model.dart';
import 'profile_header_avatar.dart';
import 'profile_header_back_button.dart';
import 'profile_header_identity.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileViewModel vm;

  const ProfileHeader({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final displayName =
        vm.name.isNotEmpty ? vm.name : S.of(context).defaultUserName;

    return Column(
      children: [
        const ProfileHeaderBackButton(),
        ProfileHeaderAvatar(bloodType: vm.bloodType),
        const SizedBox(height: 12),
        ProfileHeaderIdentity(name: displayName, bloodType: vm.bloodType),
      ],
    );
  }
}
