import 'package:flutter/material.dart';

import '../../../../core/services/signalr/signalr_service.dart';
import '../../../home/data/models/request_model.dart';
import '../cubit/donation_cubit.dart';
import 'request_details_state.dart';
import 'request_details_signalr_handler.dart';
import 'request_details_updater.dart';

class RequestDetailsController {
  final SignalRService signalR;
  final DonationCubit donationCubit;
  final RequestDetailsUpdater updater;
  final RequestDetailsSignalRHandler signalRHandler;

  RequestDetailsController({
    required this.signalR,
    required this.donationCubit,
    required this.updater,
    required this.signalRHandler,
  });

  RequestDetailsState createInitialState(RequestModel request) {
    return RequestDetailsState(
      request: request,
      donationCubit: donationCubit,
    );
  }

  void startRealtime(
    RequestModel request, {
    required VoidCallback onRefresh,
    required void Function(dynamic) onData,
  }) {
    signalRHandler.start(
      requestId: request.id!,
      onRefresh: onRefresh,
      onData: onData,
    );
  }

  void stopRealtime(RequestModel request) {
    signalRHandler.stop(request.id!);
  }

  RequestDetailsState applyUpdate(RequestDetailsState state, dynamic data) {
    return state.copyWith(request: updater.apply(state.request, data));
  }
}
