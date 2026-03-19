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
        icon: Icon(Icons.chevron_left, color: Colors.grey[700]),
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(AppRoutes.btmNavBar);
          }
        },
      ),
    );
  }
}
