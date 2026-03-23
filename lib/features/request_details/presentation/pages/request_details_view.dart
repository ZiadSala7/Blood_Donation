import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/signalr/signalr_service.dart';
import '../../../home/data/models/request_model.dart';
import '../../../home/data/repo/home_repo_impl.dart';
import '../../data/repo/donation_repo_impl.dart';
import '../cubit/donation_cubit.dart';
import 'request_details_scaffold.dart';
import 'request_details_state.dart';

class RequestDetailsView extends StatefulWidget {
  final RequestModel request;

  const RequestDetailsView({super.key, required this.request});

  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  late final DonationCubit _donationCubit;
  late final HomeRepoImpl _repo;
  final SignalRService _signalR = SignalRService();
  Timer? _refreshTimer;
  void Function(int requestId, dynamic data)? _signalrListener;
  late RequestModel _request;

  @override
  void initState() {
    super.initState();
    _request = widget.request;
    _repo = HomeRepoImpl(dio: getIt.get<DioConsumer>());
    _donationCubit = DonationCubit(
      DonationRepoImpl(dio: getIt.get<DioConsumer>()),
    );
    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _refreshRequest();
    });
    _signalR.connect().then((_) {
      final requestId = _request.id;
      if (requestId == null || !mounted) return;
      _signalrListener = (updatedRequestId, _) {
        if (!mounted || updatedRequestId != requestId) return;
        _refreshRequest();
      };
      _signalR.listenToRequestUpdates(_signalrListener!);
      _signalR.joinRequest(requestId);
    });
  }

  @override
  void didUpdateWidget(covariant RequestDetailsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.request.id != widget.request.id) {
      _request = widget.request;
    }
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    final requestId = _request.id;
    if (requestId != null) {
      _signalR.leaveRequest(requestId);
    }
    if (_signalrListener != null) {
      _signalR.removeListener(_signalrListener!);
      _signalrListener = null;
    }
    _donationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RequestDetailsScaffold(
      state: RequestDetailsState(
        request: _request,
        donationCubit: _donationCubit,
      ),
      onRefresh: _refresh,
    );
  }

  void _refresh() {
    _refreshRequest();
  }

  Future<void> _refreshRequest() async {
    final requestId = _request.id;
    if (requestId == null) return;
    final response = await _repo.getRequestById(id: requestId);
    response.fold((_) {}, (request) {
      if (!mounted) return;
      setState(() {
        _request = request;
      });
    });
  }
}
