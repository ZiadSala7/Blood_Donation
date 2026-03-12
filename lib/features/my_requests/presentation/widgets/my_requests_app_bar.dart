import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class MyRequestsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyRequestsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(S.of(context).myRequestsTitle),
      leading: const Icon(Icons.arrow_back_ios),
      actions: const [Icon(Icons.share), SizedBox(width: 12)],
    );
  }
}
