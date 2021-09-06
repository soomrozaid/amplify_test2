import 'package:flutter/material.dart';

abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged(this.username);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
}

class LoginConfirmCodeChanged extends LoginEvent {
  final String confirmCode;

  LoginConfirmCodeChanged(this.confirmCode);
}

class LoginFormSubmitted extends LoginEvent {}

class LoginCompleted extends LoginEvent {
  final String? username;
  final String? password;
  final String? confirmCode;
  final BuildContext? context;

  LoginCompleted({
    this.username,
    this.password,
    this.confirmCode,
    this.context,
  });
}

class LoginConfirmCode extends LoginEvent {
  final String? username;
  final String? confirmCode;
  final BuildContext? context;

  LoginConfirmCode({this.username, this.confirmCode, this.context});
}

class ResetPassowrd extends LoginEvent {
  final String? username;

  ResetPassowrd(this.username);
}
