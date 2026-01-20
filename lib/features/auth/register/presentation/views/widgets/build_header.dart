import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_assets.dart';

Widget buildHeader() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 30),
    decoration: const BoxDecoration(
      color: Color(0xFFB71C1C),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: Column(
      children: [
        // LOGO
        Image.asset(AppAssets.assetsImagesBldLogo, height: 100),
      ],
    ),
  );
}
