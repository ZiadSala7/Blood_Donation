abstract class ChangePasswordStates {}

class ChangeInitial extends ChangePasswordStates {}

class ChangeLoading extends ChangePasswordStates {}

class ChangeFailure extends ChangePasswordStates {
  final String errMsg;

  ChangeFailure({required this.errMsg});
}

class ChangeSuccess extends ChangePasswordStates {
  final String successMsg;

  ChangeSuccess({required this.successMsg});
}
