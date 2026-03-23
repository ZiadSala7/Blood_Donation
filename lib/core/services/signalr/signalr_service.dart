import 'package:signalr_netcore/signalr_client.dart';

class SignalRService {
  static final SignalRService _instance = SignalRService._internal();
  factory SignalRService() => _instance;
  SignalRService._internal();

  final String _serverUrl = "https://elixir.runasp.net/requestsHub";

  HubConnection? _connection;
  final Set<void Function(int requestId, dynamic data)> _updateListeners = {};
  bool _updateHandlerRegistered = false;

  bool get isConnected => _connection?.state == HubConnectionState.Connected;

  // ============================
  // CONNECT (مرة واحدة بس)
  // ============================
  Future<void> connect() async {
    if (isConnected) return;

    _connection = HubConnectionBuilder()
        .withUrl(_serverUrl)
        .withAutomaticReconnect()
        .build();

    _registerConnectionEvents();

    await _connection!.start();
    _ensureUpdateHandler();
  }

  // ============================
  // JOIN REQUEST GROUP
  // ============================
  Future<void> joinRequest(int requestId) async {
    if (!isConnected) await connect();

    try {
      await _connection!.invoke("JoinRequestRealTime", args: [requestId]);
    } catch (_) {
      // Fallback for backends that define JoinRequestRealTime with no args.
      try {
        await _connection!.invoke("JoinRequestRealTime");
      } catch (e) {
        return;
      }
    }

  }

  // ============================
  // LEAVE REQUEST GROUP
  // ============================
  Future<void> leaveRequest(int requestId) async {
    if (!isConnected) return;

    try {
      await _connection!.invoke("LeaveRequestRealTime", args: [requestId]);
    } catch (_) {
      // Fallback for backends that define LeaveRequestRealTime with no args,
      // or do not implement leave at all.
      try {
        await _connection!.invoke("LeaveRequestRealTime");
      } catch (e) {
        return;
      }
    }

  }

  // ============================
  // LISTEN TO UPDATE
  // ============================
  void listenToRequestUpdates(
    void Function(int requestId, dynamic data) onUpdate,
  ) {
    _updateListeners.add(onUpdate);
    _ensureUpdateHandler();
  }

  // ============================
  // STOP LISTENING
  // ============================
  void removeListener(void Function(int requestId, dynamic data) onUpdate) {
    _updateListeners.remove(onUpdate);
    if (_updateListeners.isEmpty) {
      _connection?.off("UpdateRequest");
      _updateHandlerRegistered = false;
    }
  }

  void stopListening() {
    _updateListeners.clear();
    _connection?.off("UpdateRequest");
    _updateHandlerRegistered = false;
  }

  // ============================
  // DISCONNECT (اختياري)
  // ============================
  Future<void> disconnect() async {
    await _connection?.stop();
  }

  // ============================
  // CONNECTION EVENTS
  // ============================
  void _registerConnectionEvents() {
    _connection?.onclose(({Exception? error}) {
    });

    _connection?.onreconnecting(({Exception? error}) {
    });

    _connection?.onreconnected(({String? connectionId}) {
    });
  }

  void _ensureUpdateHandler() {
    if (_updateHandlerRegistered || _connection == null) return;
    _updateHandlerRegistered = true;
    _connection?.on("UpdateRequest", (parameters) {
      if (parameters == null || parameters.length < 2) return;
      final int requestId = parameters[0] as int;
      final dynamic data = parameters[1];
      for (final listener in _updateListeners.toList()) {
        listener(requestId, data);
      }
    });
  }
}
