import 'package:amplify_test2/bloc/login/login_bloc.dart';
import 'package:amplify_test2/bloc/login/login_event.dart';
import 'package:amplify_test2/bloc/login/login_state.dart';
import 'package:amplify_test2/widgets/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginConfirmationScreen extends StatelessWidget {
  const LoginConfirmationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        print(state.username);
        print(state.confirmCode);
        return SignupScreen(
          context: context,
          state: state,
          onTextChanged: (value) {
            context.read<LoginBloc>().add(LoginConfirmCodeChanged(value));
            print(value);
          },
          icon: Icons.person,
          hintText: 'Confirm Code',
          routeName: '/dashboard',
          onNextScreen: () {
            context.read<LoginBloc>().add(
                  LoginConfirmCode(
                    username: state.username,
                    confirmCode: state.confirmCode,
                    context: context,

                  ),
                );
          },
        );
      },
    );
  }
}
