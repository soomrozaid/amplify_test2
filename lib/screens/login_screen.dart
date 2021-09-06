import 'package:amplify_test2/bloc/login/login_bloc.dart';
import 'package:amplify_test2/bloc/login/login_event.dart';
import 'package:amplify_test2/bloc/login/login_state.dart';
import 'package:amplify_test2/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTextField(
                  onChanged: (value) => context
                      .read<LoginBloc>()
                      .add(LoginUsernameChanged(value)),
                  labelText: 'Email',
                  icon: Icons.mail,
                ),
                LoginTextField(
                  onChanged: (value) => context
                      .read<LoginBloc>()
                      .add(LoginPasswordChanged(value)),
                  labelText: 'Password',
                  icon: Icons.password,
                ),
                ElevatedButton(
                  onPressed: () => context.read<LoginBloc>().add(LoginCompleted(
                        username: state.username,
                        password: state.password,
                        context: context,
                      )),
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () => context
                      .read<LoginBloc>()
                      .add(ResetPassowrd(state.username)),
                  child: const Text('Forgot Password?'),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/email'),
                  child: const Text('Signup'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
