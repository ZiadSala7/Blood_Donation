import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blood_donation/firebase_options.dart';

import 'core/di/injection.dart';
import 'blood_donation_app.dart';
import 'core/api/dio_consumer.dart';
import 'core/helper/lookup_api_functions.dart';
import 'core/services/notifications/app_notification_handler.dart';
import 'core/services/notifications/fcm_notificatoin_service.dart';
import 'features/auth/login/data/repo/login_repo_impl.dart';
import 'core/managers/location_cubit/cubit/location_cubit.dart';
import 'features/auth/login/presentation/cubit/login_cubit.dart';
import 'features/add_request/data/repo/add_request_repo_impl.dart';
import 'core/managers/location_cubit/repo/location_repo_impl.dart';
import 'features/add_request/presentation/cubit/add_request_cubit.dart';
import 'features/home/data/repo/home_repo_impl.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'package:nested/nested.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final dioConsumer = getIt.get<DioConsumer>();

  // Keep required cached data ready before creating cubits that depend on it.
  await Future.wait([getAllGovs(dioConsumer), getAllDonationCats(dioConsumer)]);

  final notificationHandler = AppNotificationHandler(
    navigatorKey: navigatorKey,
  );
  final fcmService = FCMNotificationService(handler: notificationHandler);

  runApp(
    MultiBlocProvider(
      providers: multiBlocProviderList(dioConsumer),
      child: const BloodDonationApp(),
    ),
  );

  // Run non-critical startup work after first frame scheduling.
  unawaited(_runDeferredStartupTasks(fcmService));
}

List<SingleChildWidget> multiBlocProviderList(DioConsumer dioConsumer) {
  return [
    BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl(dioConsumer))..cachedData(),
    ),
    BlocProvider(
      create: (context) =>
          LocationCubit(LocationRepoImpl(dio: dioConsumer))..getCities(),
    ),
    BlocProvider(
      create: (context) =>
          AddRequestCubit(AddRequestRepoImpl(dio: dioConsumer)),
    ),
    BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepoImpl(dio: dioConsumer))
            ..getRequestsWithPagination(),
    ),
  ];
}

Future<void> _runDeferredStartupTasks(FCMNotificationService fcmService) async {
  await Future.wait([
    _runStartupTask('fcmService.initialize', () => fcmService.initialize()),
    _runStartupTask('initTowns', initTowns),
  ]);
}

Future<void> _runStartupTask(
  String taskName,
  Future<void> Function() task,
) async {
  try {
    await task();
  } catch (e, stackTrace) {
    debugPrint('Deferred startup task failed ($taskName): $e\n$stackTrace');
  }
}
