import 'package:signalr_netcore/signalr_client.dart';

class SignalRService {
  static final SignalRService _instance = SignalRService._internal();
  factory SignalRService() => _instance;
  SignalRService._internal();

  final String _serverUrl = "https://elixir.runasp.net/requestsHub";

  HubConnection? _connection;

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
    print("✅ SignalR Connected");
  }

  // ============================
  // JOIN REQUEST GROUP
  // ============================
  Future<void> joinRequest(int requestId) async {
    if (!isConnected) await connect();

    try {
      await _connection!.invoke("JoinRequestRealTime");
    } catch (_) {
      // Fallback for backends that define JoinRequestRealTime with no args.
      try {
        await _connection!.invoke("JoinRequestRealTime");
      } catch (e) {
        print("⚠️ JoinRequestRealTime failed: $e");
        return;
      }
    }

    print("📌 Joined Request Group: $requestId");
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
        print("⚠️ LeaveRequestRealTime is unavailable on server: $e");
        return;
      }
    }

    print("🚪 Left Request Group: $requestId");
  }

  // ============================
  // LISTEN TO UPDATE
  // ============================
  void listenToRequestUpdates(
    void Function(int requestId, dynamic data) onUpdate,
  ) {
    _connection?.off("UpdateRequest"); // منع التكرار

    _connection?.on("UpdateRequest", (parameters) {
      if (parameters == null || parameters.length < 2) return;

      final int requestId = parameters[0] as int;
      final dynamic data = parameters[1];

      print("🔥 Update Received for Request: $requestId");

      onUpdate(requestId, data);
    });
  }

  // ============================
  // STOP LISTENING
  // ============================
  void stopListening() {
    _connection?.off("UpdateRequest");
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
      print("🔴 Connection Closed");
    });

    _connection?.onreconnecting(({Exception? error}) {
      print("🟡 Reconnecting...");
    });

    _connection?.onreconnected(({String? connectionId}) {
      print("🟢 Reconnected");
    });
  }
}
