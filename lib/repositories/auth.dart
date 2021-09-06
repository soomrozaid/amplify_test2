import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/rendering.dart';

class AuthRepository {
  Future<String> login({
    required String username,
    required String password,
  }) async {
    // await Future.delayed(const Duration(seconds: 5));
    // return username +
    //     password +
    //     username.length.toString() +
    //     password.length.toString();
    try {
      final SignInResult result =
          await Amplify.Auth.signIn(username: username, password: password);
      print(result.isSignedIn);
      return result.isSignedIn ? 'true' : 'false';
    } on AuthException catch (e) {
      print(e);
      if (e is UserNotConfirmedException) {
        return 'notConfirmed';
      } else if (e is UserNotFoundException) {
        return 'notFound';
      }
      print(AuthException);
    } catch (e) {
      print(e.toString());
      return 'false';
    }
    return 'false';
  }

  Future<bool> signup({
    required String username,
    required String password,
    required String email,
    required String confirmPassword,
  }) async {
    // await Future.delayed(const Duration(seconds: 5));
    // SignUpResult result = await AmplifyAuthCognito()
    //     .signUp(request: SignUpRequest(username: username, password: password));
    try {
      SignUpResult result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: {'email': email}),
      );
      print(result.nextStep);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void signOut() {
    // Future.delayed(const Duration(seconds: 2));
    // await
    Amplify.Auth.signOut();
  }

  Future<bool> confirmCode(
      {required String code, required String username}) async {
    // await Future.delayed(const Duration(seconds: 5));
    // return 'mmasmdas2331';
    try {
      SignUpResult result = await Amplify.Auth.confirmSignUp(
          username: username, confirmationCode: code);
      print(result);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future resetPassword(username) async {
    ResetPasswordResult result =
        await Amplify.Auth.resetPassword(username: username);
    return result.nextStep;
  }
}
