import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/signalr/signalr_service.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final SignalRService _signalR = SignalRService();
  final Set<int> _joinedRequestIds = {};
  void Function(int requestId, dynamic data)? _signalrListener;

  @override
  void initState() {
    super.initState();
    _initRealtime();
  }

  Future<void> _initRealtime() async {
    await _signalR.connect();
    _signalrListener = (requestId, _) {
      if (!mounted) return;
      context.read<HomeCubit>().refreshRequests();
    };
    _signalR.listenToRequestUpdates(_signalrListener!);
  }

  @override
  void dispose() {
    for (final id in _joinedRequestIds) {
      unawaited(_signalR.leaveRequest(id));
    }
    if (_signalrListener != null) {
      _signalR.removeListener(_signalrListener!);
      _signalrListener = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: BlocListener<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is HomeSuccess) {
              _syncJoinedRequests();
            }
          },
          child: const HomeViewBody(),
        ),
      ),
    );
  }

  void _syncJoinedRequests() {
    final entities = context.read<HomeCubit>().allEntities;
    final currentIds = <int>{};
    for (final entity in entities) {
      final id = entity.id;
      if (id == null) continue;
      currentIds.add(id);
      if (_joinedRequestIds.add(id)) {
        unawaited(_signalR.joinRequest(id));
      }
    }

    final toLeave = _joinedRequestIds.difference(currentIds);
    if (toLeave.isEmpty) return;
    for (final id in toLeave) {
      unawaited(_signalR.leaveRequest(id));
    }
    _joinedRequestIds.removeAll(toLeave);
  }
}
