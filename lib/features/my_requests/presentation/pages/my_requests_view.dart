import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/signalr/signalr_service.dart';
import '../../data/repo/my_requests_repo_impl.dart';
import '../cubit/my_requests_cubit.dart';
import '../cubit/my_requests_states.dart';
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
  final SignalRService _signalR = SignalRService();
  final Set<int> _joinedRequestIds = {};
  void Function(int requestId, dynamic data)? _signalrListener;

  @override
  void initState() {
    super.initState();
    _cubit = MyRequestsCubit(MyRequestsRepoImpl(dio: getIt.get<DioConsumer>()))
      ..loadPage(1);
    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _cubit.refresh();
    });
    _signalR.connect().then((_) {
      _signalrListener = (requestId, _) {
        // Any request update should refresh the current list.
        if (!mounted) return;
        _cubit.refresh();
      };
      _signalR.listenToRequestUpdates(_signalrListener!);
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    for (final id in _joinedRequestIds) {
      _signalR.leaveRequest(id);
    }
    if (_signalrListener != null) {
      _signalR.removeListener(_signalrListener!);
      _signalrListener = null;
    }
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
        body: BlocListener<MyRequestsCubit, MyRequestsState>(
          listener: (context, state) {
            if (state is MyRequestsSuccess) {
              // Join real-time updates for each visible request.
              for (final item in state.items) {
                final id = item.request.id;
                if (id != null && _joinedRequestIds.add(id)) {
                  _signalR.joinRequest(id);
                }
              }
            }
          },
          child: const MyRequestsBody(),
        ),
      ),
    );
  }
}
