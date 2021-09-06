class LoginState {
  final String? username;
  final String? password;
  final String? confirmCode;
  final dynamic formState;

  LoginState({
    this.username,
    this.password,
    this.confirmCode,
    this.formState,
  });

  LoginState copyWith({
    String? username,
    String? password,
    String? confirmCode,
    dynamic formState,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmCode: confirmCode ?? this.confirmCode,
      formState: formState ?? this.formState,
    );
  }
}
