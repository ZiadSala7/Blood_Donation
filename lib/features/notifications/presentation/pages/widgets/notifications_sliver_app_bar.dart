import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class NotificationsSliverAppBar extends StatelessWidget {
  const NotificationsSliverAppBar({
    super.key,
  });

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
      automaticallyImplyLeading: false,
    );
  }
}
