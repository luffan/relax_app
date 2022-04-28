import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relax_app/data/data_interface/i_auth_client.dart';

import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final IAuthClient _authClient;

  SignInCubit(this._authClient)
      : super(
          SignInState(
            email: '',
            password: '',
          ),
        );

  Future<void> signIn() async {
    await _authClient.signIn(
      email: state.email,
      password: state.password,
    );
  }

  void updateEmail(String? email) => emit(
        state.copyWith(
          email: email?.trim() ?? '',
        ),
      );

  void updatePassword(String? password) => emit(
        state.copyWith(
          password: password?.trim() ?? '',
        ),
      );
}
