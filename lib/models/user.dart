class User {
  final String? username;
  final String? email;

  User({this.email, this.username});

  User copyWith(String? username, String? email) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }
}
