import 'package:amplify_test2/bloc/login/login_event.dart';
import 'package:amplify_test2/bloc/login/login_state.dart';
import 'package:amplify_test2/repositories/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authRepo = AuthRepository();
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginConfirmCodeChanged) {
      yield state.copyWith(confirmCode: event.confirmCode);
    } else if (event is LoginFormSubmitted) {
      yield* _mapLoginFormSubmittedToState(event);
    } else if (event is LoginCompleted) {
      yield* _mapLoginCompletedToState(event);
    } else if (event is LoginConfirmCode) {
      yield* _mapLoginConfirmCodeToState(event);
    } else if (event is ResetPassowrd) {
      yield* _mapResetPasswordToState(event.username);
    }
  }

  Stream<LoginState> _mapLoginCompletedToState(event) async* {
    String isLogin = await authRepo.login(
        username: event.username, password: event.password);
    if (isLogin == 'true') {
      Navigator.pushNamed(event.context, '/dashboard');
    } else if (isLogin == 'notConfirmed') {
      Navigator.pushNamed(event.context, '/loginConfirmCodeScreen');
    } else if (isLogin == 'notFound') {
      // event.context.read()
      ScaffoldMessenger.of(event.context)
          .showSnackBar(const SnackBar(content: Text('User Not Found')));
    }
  }

  Stream<LoginState> _mapLoginFormSubmittedToState(event) async* {
    yield state.copyWith(formState: 'Form Submitting');
    try {
      yield state.copyWith(formState: 'Form Submitted Successfully');
    } catch (e) {
      yield state.copyWith(formState: 'Form Submission Failed' + e.toString());
    }
  }

  Stream<LoginState> _mapLoginConfirmCodeToState(event) async* {
    bool isLogin = await authRepo.confirmCode(
        code: event.confirmCode, username: event.username);
    if (isLogin) {
      Navigator.pushNamed(event.context, '/dashboard');
    }
  }

  Stream<LoginState> _mapResetPasswordToState(username) async* {
    try {
      final result = await authRepo.resetPassword(username);
      print(result);
    } catch (e) {
      print(e.toString());
    }
  }
}
