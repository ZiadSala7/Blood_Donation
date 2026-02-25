abstract class OtpStates {}

class OtpInitial extends OtpStates {}

class OtpLoading extends OtpStates {}

class OtpFailure extends OtpStates {
  final String errMsg;

  OtpFailure({required this.errMsg});
}

class OtpSuccess extends OtpStates {
  final String resetToken;

  OtpSuccess({required this.resetToken});
}

class OtpResendSuccess extends OtpStates {}
