import 'package:amplify_test2/bloc/signup/signup_event.dart';
import 'package:amplify_test2/bloc/signup/signup_state.dart';
import 'package:amplify_test2/repositories/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState());

  final authRepo = AuthRepository();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is SignupPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignupConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);
    } else if (event is SignupEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is ConfirmCodeChanged) {
      yield state.copyWith(confirmCode: event.code);
    } else if (event is SignupFormSubmitted) {
      yield* _mapSignupFormSubmittedToState();
    } else if (event is SignupCompleted) {
      yield* _mapSignupCompletedToState(event);
    } else if (event is SignupCodeConfirmed) {
      yield* _mapSignupCodeConfirmationToState(event);
    }
  }

  Stream<SignupState> _mapSignupFormSubmittedToState() async* {
    yield state.copyWith(formState: 'Form Submitting');
    try {
      yield state.copyWith(formState: 'Form Submitted Successfully');
    } catch (e) {
      yield state.copyWith(formState: 'Form Submission Failed' + e.toString());
    }
  }

  Stream<SignupState> _mapSignupCompletedToState(event) async* {
    String username = event.username;
    String password = event.password;
    String confirmPassword = event.confirmPassword;
    String email = event.email;

    bool isSuccess = await authRepo.signup(
      username: username,
      password: password,
      email: email,
      confirmPassword: confirmPassword,
    );

    if (isSuccess) {
      Navigator.pushReplacementNamed(event.context, '/confirmCode');
    }
  }

  Stream<SignupState> _mapSignupCodeConfirmationToState(event) async* {
    String username = event.username;
    String code = event.code;

    bool isSuccess = await authRepo.confirmCode(code: code, username: username);

    if (isSuccess) {
      Navigator.pushReplacementNamed(event.context, '/dashboard');
    }
  }
}
