import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/signalr/signalr_service.dart';
import '../cubit/home_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final SignalRService _signalR = SignalRService();

  @override
  void initState() {
    super.initState();
    _initRealtime();
  }

  Future<void> _initRealtime() async {
    await _signalR.connect();
    _signalR.listenToRequestUpdates((_, _) {
      if (!mounted) return;
      context.read<HomeCubit>().refreshRequests();
    });
  }

  @override
  void dispose() {
    _signalR.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: HomeViewBody()));
  }
}
