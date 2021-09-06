import 'package:flutter/widgets.dart';

abstract class SignupEvent {}

class SignupUsernameChanged extends SignupEvent {
  final String username;

  SignupUsernameChanged(this.username);
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  SignupPasswordChanged(this.password);
}

class SignupConfirmPasswordChanged extends SignupEvent {
  final String confirmPassword;

  SignupConfirmPasswordChanged(this.confirmPassword);
}

class SignupEmailChanged extends SignupEvent {
  final String email;

  SignupEmailChanged(this.email);
}

class ConfirmCodeChanged extends SignupEvent {
  final String code;

  ConfirmCodeChanged(this.code);
}

class SignupFormSubmitted extends SignupEvent {}

class SignupCompleted extends SignupEvent {
  final String? username;
  final String? password;
  final String? confirmPassword;
  final String? email;
  final BuildContext? context;

  SignupCompleted({
    this.username,
    this.password,
    this.confirmPassword,
    this.email,
    this.context,
  });
}

class SignupCodeConfirmed extends SignupEvent {
  final String? username;
  final String? code;
  final BuildContext? context;

  SignupCodeConfirmed({this.username, this.code, this.context});
}
