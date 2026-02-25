import 'dart:async';
import 'package:flutter/material.dart';

mixin OtpTimerMixin<T extends StatefulWidget> on State<T> {
  static const int initialSeconds = 45;
  Timer? _timer;
  int remainingSeconds = initialSeconds;

  void startTimer() {
    _timer?.cancel();
    setState(() {
      remainingSeconds = initialSeconds;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds <= 1) {
        timer.cancel();
        setState(() => remainingSeconds = 0);
      } else {
        setState(() => remainingSeconds--);
      }
    });
  }

  String formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
