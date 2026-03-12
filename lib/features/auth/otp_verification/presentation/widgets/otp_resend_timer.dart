import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class OtpResendTimer extends StatelessWidget {
  final int remainingSeconds;
  final String Function(int) formatTime;
  final VoidCallback onResend;

  const OtpResendTimer({
    super.key,
    required this.remainingSeconds,
    required this.formatTime,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: remainingSeconds > 0
          ? Text(
              S.of(context).otpResendIn(
                formatTime(remainingSeconds),
              ),
              style: AppTextStyles.r16(context),
            )
          : TextButton(
              onPressed: onResend,
              child: Text(
                S.of(context).otpResendCode,
                style: AppTextStyles.r16(context),
              ),
            ),
    );
  }
}
