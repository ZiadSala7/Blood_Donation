import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPinput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onCompleted;

  const OtpPinput({super.key, required this.controller, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    final focusedTheme = defaultTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: controller,
        length: 6,
        defaultPinTheme: defaultTheme,
        focusedPinTheme: focusedTheme,
        submittedPinTheme: defaultTheme,
        showCursor: true,
        onCompleted: onCompleted,
      ),
    );
  }
}
