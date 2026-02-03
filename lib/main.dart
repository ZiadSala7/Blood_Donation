import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blood_donation/firebase_options.dart';

import 'core/di/injection.dart';
import 'blood_donation_app.dart';
import 'core/api/dio_consumer.dart';
import 'features/auth/login/data/repo/login_repo_impl.dart';
import 'core/managers/location_cubit/cubit/location_cubit.dart';
import 'features/auth/login/presentation/cubit/login_cubit.dart';
import 'core/managers/location_cubit/repo/location_repo_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var dioConsumer = getIt.get<DioConsumer>();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LoginCubit(LoginRepoImpl(dioConsumer))..cachedData(),
        ),
        BlocProvider(
          create: (context) =>
              LocationCubit(LocationRepoImpl(dio: dioConsumer))..getCities(),
        ),
      ],
      child: const BloodDonationApp(),
    ),
  );
}
