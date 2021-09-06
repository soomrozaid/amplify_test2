class SignupState {
  final String? username;
  final String? password;
  final String? confirmPassword;
  final String? email;
  final String? confirmCode;
  final dynamic formState;

  SignupState({
    this.username,
    this.password,
    this.email,
    this.confirmPassword,
    this.confirmCode,
    this.formState,
  });

  SignupState copyWith({
    String? username,
    String? password,
    String? confirmPassword,
    String? email,
    String? confirmCode,
    dynamic formState,
  }) {
    return SignupState(
      username: username ?? this.username,
      password: password ?? this.password,
      formState: formState ?? this.formState,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmCode: confirmPassword ?? this.confirmCode,
      email: email ?? this.email,
    );
  }
}
