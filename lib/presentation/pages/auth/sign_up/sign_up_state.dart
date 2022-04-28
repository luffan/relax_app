class SignUpState {
  final String name;
  final String email;
  final String password;

  SignUpState({
    required this.name,
    required this.email,
    required this.password,
  });

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
