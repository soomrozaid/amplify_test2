import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_test2/amplifyconfiguration.dart';
import 'package:amplify_test2/bloc/login/login_bloc.dart';
import 'package:amplify_test2/bloc/signup/signup_bloc.dart';
import 'package:amplify_test2/models/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/login',
        // routes: ({
        //   '/email': (context) => const EmailScreen(),
        //   '/password': (context) => const PasswordScreen(),
        //   '/confirmPassword': (context) => const ConfirmPasswordScreen(),
        //   '/username': (context) => const UsernameScreen(),
        //   '/confirmCode': (context) => const ConfirmCodeScreen(),
        //   '/dashboard': (context) => DashboardScreen(user: )
        // }),
        onGenerateRoute: (settings) => RouteGenerator().generateRoute(settings),
      ),
    );
  }

  void _configureAmplify() async {
    if (!Amplify.isConfigured) {
      try {
        Amplify.addPlugin(AmplifyAuthCognito());

        Amplify.configure(amplifyconfig);
      } catch (e) {
        throw e.toString();
      }
    }
  }
}
