import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

AppBar requestDetailsAppBar(BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.white,
    title: Text(S.of(context).requestDetailsTitle),
    centerTitle: true,
    actions: const [Icon(Icons.share), SizedBox(width: 12)],
  );
}
