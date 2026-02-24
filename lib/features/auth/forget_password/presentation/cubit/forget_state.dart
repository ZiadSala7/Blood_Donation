abstract class ForgetStates {}

class InitialForgetState extends ForgetStates {}

class LoadingForgetState extends ForgetStates {}

class SuccessForgetState extends ForgetStates {}

class FailureForgetState extends ForgetStates {
  final String errMsg;

  FailureForgetState({required this.errMsg});
}
