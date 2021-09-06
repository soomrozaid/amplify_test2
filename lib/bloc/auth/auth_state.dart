abstract class AuthState {}

class InitialAuthState extends AuthState {}

class UnAuthorizedAuthState extends AuthState {}

class AuthorizedAuthState extends AuthState {
  final String userId;

  AuthorizedAuthState(this.userId);
}
