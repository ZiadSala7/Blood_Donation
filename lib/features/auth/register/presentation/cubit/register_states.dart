abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoading extends RegisterStates {}

class RegisterFailure extends RegisterStates {
  final String errMsg;

  RegisterFailure({required this.errMsg});
}

class RegisterSuccess extends RegisterStates {}
