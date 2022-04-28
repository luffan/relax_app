import 'package:firebase_auth/firebase_auth.dart' as fb;

class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  factory User.fromFirebase(fb.User? user) {
    return User(
      name: user?.displayName ?? '',
      email: user?.email ?? '',
    );
  }

  bool get isNotActive => name.isEmpty && email.isEmpty;
}
