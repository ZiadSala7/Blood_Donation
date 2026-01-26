import '../../../register/data/models/register_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginFailure extends LoginStates {
  final String errMsg;

  LoginFailure({required this.errMsg});
  
}

class LoginSuccess extends LoginStates {
  final RegisterModel model;

  LoginSuccess({required this.model});
}
