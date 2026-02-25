abstract class ResetPasswordStates {}

class InitialResetPasswordState extends ResetPasswordStates {}

class LoadingResetPasswordState extends ResetPasswordStates {}

class SuccessResetPasswordState extends ResetPasswordStates {}

class FailureResetPasswordState extends ResetPasswordStates {
  final String errMsg;

  FailureResetPasswordState({required this.errMsg});
}
