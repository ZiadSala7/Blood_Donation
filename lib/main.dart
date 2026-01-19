import 'package:blood_donation/core/di/injection.dart';
import 'package:flutter/material.dart';

import 'blood_donation_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const BloodDonationApp());
}
