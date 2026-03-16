import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/services/signalr/signalr_service.dart';

class RequestDetailsSignalRHandler {
  final SignalRService signalR;
  Timer? _refreshTimer;

  RequestDetailsSignalRHandler(this.signalR);

  void start({
    required int requestId,
    required VoidCallback onRefresh,
    required void Function(dynamic) onData,
  }) {
    signalR.joinRequest(requestId);
    signalR.listenToRequestUpdates((id, data) {
      if (id == requestId) {
        onData(data);
      }
    });
    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      onRefresh();
    });
  }

  void stop(int requestId) {
    _refreshTimer?.cancel();
    signalR.leaveRequest(requestId);
    signalR.stopListening();
  }
}
