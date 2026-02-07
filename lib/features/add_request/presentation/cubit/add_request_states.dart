abstract class AddRequestStates {}

class InitialAddRequestState extends AddRequestStates {}

class LoadingAddRequestState extends AddRequestStates {}

class SuccessAddRequestState extends AddRequestStates {}

class FailureAddRequestState extends AddRequestStates {
  final String errMsg;

  FailureAddRequestState({required this.errMsg});
}
