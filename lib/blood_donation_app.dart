import 'package:flutter/material.dart';
import 'core/constants/localization_delegates_list.dart';
import 'core/utils/app_routes.dart';
import 'generated/l10n.dart';

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.appRouter,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: localizationDelegatesList,
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(fontFamily: 'Cairo'),
    );
  }
}
