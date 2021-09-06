import 'package:amplify_test2/bloc/signup/signup_bloc.dart';
import 'package:amplify_test2/bloc/signup/signup_event.dart';
import 'package:amplify_test2/bloc/signup/signup_state.dart';
import 'package:amplify_test2/widgets/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmCodeScreen extends StatelessWidget {
  const ConfirmCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        print(state.email);
        print(state.username);
        print(state.confirmCode);
        return SignupScreen(
          context: context,
          state: state,
          onTextChanged: (value) {
            context.read<SignupBloc>().add(ConfirmCodeChanged(value));
            print(value);
          },
          icon: Icons.person,
          hintText: 'Confirm Code',
          routeName: '/dashboard',
          onNextScreen: () {
            context.read<SignupBloc>().add(
                  SignupCodeConfirmed(
                    // username: state.email,
                    code: state.confirmCode,
                    context: context,
                    // username: 'soomrobusiness@gmail.com',
                    username: state.email,
                    // code: '909277',

                  ),
                );
          },
        );
      },
    );
  }
}
