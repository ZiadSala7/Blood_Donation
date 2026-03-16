import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routes.dart';

class ProfileHeaderBackButton extends StatelessWidget {
  const ProfileHeaderBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(Icons.chevron_right, color: Colors.grey[700]),
        onPressed: () => context.go('${AppRoutes.btmNavBar}?tab=0'),
      ),
    );
  }
}
