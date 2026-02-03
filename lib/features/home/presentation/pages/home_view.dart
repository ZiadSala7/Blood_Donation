import 'dart:developer';

import 'package:blood_donation/core/api/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/databases/cach_helper.dart';
import '../../../../core/di/injection.dart';
import '../../data/repo/home_repo_impl.dart';
import '../cubit/home_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final token = CacheHelper().getString(ApiKeys.token);
    log(token!);
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepoImpl(dio: getIt.get<DioConsumer>()))
            ..getRequestsWithPagination(),
      child: const Scaffold(body: SafeArea(child: HomeViewBody())),
    );
  }
}
