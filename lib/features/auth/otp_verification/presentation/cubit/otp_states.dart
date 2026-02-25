abstract class OtpStates {}

class OtpInitial extends OtpStates {}

class OtpLoading extends OtpStates {}

class OtpFailure extends OtpStates {
  final String errMsg;

  OtpFailure({required this.errMsg});
}

class OtpSuccess extends OtpStates {}

class OtpResendSuccess extends OtpStates {}
