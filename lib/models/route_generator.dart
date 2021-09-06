import 'package:amplify_test2/bloc/login/login_event.dart';
import 'package:amplify_test2/screens/error.dart';
import 'package:amplify_test2/screens/login_confirmation_screen.dart';
import 'package:amplify_test2/screens/login_screen.dart';
import 'package:amplify_test2/signup_flow/confirm_code_screen.dart';
import 'package:amplify_test2/signup_flow/confirm_password_screen.dart';
import 'package:amplify_test2/signup_flow/email_screen.dart';
import 'package:amplify_test2/signup_flow/last_screen.dart';
import 'package:amplify_test2/signup_flow/password_screen.dart';
import 'package:amplify_test2/signup_flow/username_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteGenerator {
  generateRoute(RouteSettings settings) {
    // final arg = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/loginConfirmCodeScreen':
        return MaterialPageRoute(
            builder: (_) => const LoginConfirmationScreen());
      case '/email':
        return MaterialPageRoute(builder: (_) => const EmailScreen());
      case '/password':
        return MaterialPageRoute(builder: (_) => const PasswordScreen());
      case '/confirmPassword':
        return MaterialPageRoute(builder: (_) => const ConfirmPasswordScreen());
      case '/username':
        return MaterialPageRoute(builder: (_) => const UsernameScreen());
      case '/confirmCode':
        return MaterialPageRoute(builder: (_) => const ConfirmCodeScreen());
      case '/dashboard':
        // print(arg ?? 'arg null');
        // if (arg is User) {
        //   print(arg);
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      // }
      // return MaterialPageRoute(
      //     builder: (_) => const ErrorScreen(err: 'args didn\'t work'));
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
