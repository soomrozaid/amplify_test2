import 'package:amplify_test2/bloc/signup/signup_bloc.dart';
import 'package:amplify_test2/bloc/signup/signup_event.dart';
import 'package:amplify_test2/bloc/signup/signup_state.dart';
import 'package:amplify_test2/widgets/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  const ConfirmPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return SignupScreen(
          context: context,
          state: state,
          onTextChanged: (value) => context
              .read<SignupBloc>()
              .add(SignupConfirmPasswordChanged(value)),
          icon: Icons.person,
          hintText: 'Confirm Password',
          routeName: '/username',
        );
      },
    );
  }
}
