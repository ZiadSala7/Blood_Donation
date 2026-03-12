import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../data/repo/my_requests_repo_impl.dart';
import '../cubit/my_requests_cubit.dart';
import '../widgets/my_requests_app_bar.dart';
import '../widgets/my_requests_body.dart';

class MyRequestsView extends StatefulWidget {
  const MyRequestsView({super.key});

  @override
  State<MyRequestsView> createState() => _MyRequestsViewState();
}

class _MyRequestsViewState extends State<MyRequestsView> {
  late final MyRequestsCubit _cubit;
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _cubit = MyRequestsCubit(MyRequestsRepoImpl(dio: getIt.get<DioConsumer>()))
      ..loadPage(1);
    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _cubit.refresh();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: const MyRequestsAppBar(),
        body: const MyRequestsBody(),
      ),
    );
  }
}
