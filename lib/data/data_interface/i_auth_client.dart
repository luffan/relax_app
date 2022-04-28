import 'package:relax_app/data/model/user.dart';

abstract class IAuthClient {
  User get currentUser;

  Stream<User> get userChanges;

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  });

  void signOut();
}
