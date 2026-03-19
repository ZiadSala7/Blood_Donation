import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../generated/l10n.dart';

class NotificationsSliverAppBar extends StatelessWidget {
  const NotificationsSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      scrolledUnderElevation: 0,
      title: Text(S.of(context).notificationsTitle),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
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
