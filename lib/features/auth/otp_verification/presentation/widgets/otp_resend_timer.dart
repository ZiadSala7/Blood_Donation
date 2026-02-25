import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';

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
              "إعادة الإرسال خلال ${formatTime(remainingSeconds)}",
              style: AppTextStyles.r16(context),
            )
          : TextButton(
              onPressed: onResend,
              child: Text(
                "إعادة إرسال الكود",
                style: AppTextStyles.r16(context),
              ),
            ),
    );
  }
}
