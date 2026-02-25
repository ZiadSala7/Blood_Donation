import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/email_encoding.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../cubit/otp_cubit.dart';
import '../widgets/otp_pinput.dart';
import '../widgets/otp_resend_timer.dart';
import 'otp_timer_mixin.dart';

class OtpVerificationViewBody extends StatefulWidget {
  final String email;
  const OtpVerificationViewBody({super.key, required this.email});

  @override
  State<OtpVerificationViewBody> createState() =>
      _OtpVerificationViewBodyState();
}

class _OtpVerificationViewBodyState extends State<OtpVerificationViewBody>
    with OtpTimerMixin {
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<void> _resendOtp() async {
    if (remainingSeconds > 0) return;

    final success = await context.read<OtpCubit>().resendOtpByEmail(
      widget.email,
    );

    if (mounted && success) {
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final encodedEmail = maskEmailStrong(widget.email);
    final cubit = context.watch<OtpCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: ListView(
        children: [
          const SizedBox(height: 150),

          Text(
            S.of(context).confirmPassForget,
            style: AppTextStyles.b32(context),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          Text(
            "أدخل الكود المرسل إلى \n$encodedEmail",
            style: AppTextStyles.r20(context),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 60),

          OtpPinput(
            controller: otpController,
            onCompleted: (otp) => debugPrint("OTP: $otp"),
          ),

          const SizedBox(height: 24),

          OtpResendTimer(
            remainingSeconds: remainingSeconds,
            formatTime: formatTime,
            onResend: _resendOtp,
          ),

          const SizedBox(height: 32),

          CustomButton(
            label: "تأكيد",
            height: 56,
            onPressed: () async {
              if (otpController.text.length == 6) {
                await cubit.verifyOtpByEmail(widget.email, otpController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
