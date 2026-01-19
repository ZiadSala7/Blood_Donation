import 'package:flutter/material.dart';

import 'core/utils/app_routes.dart';

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRoutes.appRouter);
  }
}
