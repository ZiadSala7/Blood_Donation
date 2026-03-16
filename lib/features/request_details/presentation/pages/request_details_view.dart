import 'package:flutter/material.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/signalr/signalr_service.dart';
import '../../../home/data/models/request_model.dart';
import '../../data/repo/donation_repo_impl.dart';
import '../cubit/donation_cubit.dart';
import 'request_details_controller.dart';
import 'request_details_scaffold.dart';
import 'request_details_signalr_handler.dart';
import 'request_details_state.dart';
import 'request_details_updater.dart';

class RequestDetailsView extends StatefulWidget {
  final RequestModel request;

  const RequestDetailsView({super.key, required this.request});

  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  late final RequestDetailsController _controller;
  late RequestDetailsState _state;

  @override
  void initState() {
    super.initState();
    final signalR = SignalRService();
    _controller = RequestDetailsController(
      signalR: signalR,
      donationCubit: DonationCubit(
        DonationRepoImpl(dio: getIt.get<DioConsumer>()),
      ),
      updater: RequestDetailsUpdater(),
      signalRHandler: RequestDetailsSignalRHandler(signalR),
    );
    _state = _controller.createInitialState(widget.request);

    _controller.startRealtime(
      widget.request,
      onRefresh: _refresh,
      onData: _handleSignalrData,
    );
  }

  @override
  void dispose() {
    _controller.stopRealtime(widget.request);
    _state.donationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RequestDetailsScaffold(state: _state);
  }

  void _handleSignalrData(dynamic data) {
    setState(() {
      _state = _controller.applyUpdate(_state, data);
    });
  }

  void _refresh() {
    if (!mounted) return;
    setState(() {});
  }
}
