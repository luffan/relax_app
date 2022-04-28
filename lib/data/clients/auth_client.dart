import 'package:firebase_auth/firebase_auth.dart';
import 'package:relax_app/data/data_interface/i_auth_client.dart';
import 'package:relax_app/data/model/user.dart' as app;

class AuthClient implements IAuthClient {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  app.User get currentUser => app.User.fromFirebase(_auth.currentUser);

  @override
  Stream<app.User> get userChanges =>
      _auth.userChanges().map((user) => app.User.fromFirebase(user));

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async =>
      _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;

    if (user != null) {
      user.updateDisplayName(name);
    }
  }

  @override
  void signOut() => _auth.signOut();
}
