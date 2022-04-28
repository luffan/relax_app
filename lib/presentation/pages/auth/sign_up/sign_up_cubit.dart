import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relax_app/data/data_interface/i_auth_client.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final IAuthClient _authClient;

  SignUpCubit(this._authClient)
      : super(
          SignUpState(
            name: '',
            email: '',
            password: '',
          ),
        );

  Future<void> signUp() async {
    await _authClient.signUp(
      name: state.name,
      email: state.email,
      password: state.password,
    );
  }

  void updateName(String? name) => emit(
        state.copyWith(
          name: name?.trim() ?? '',
        ),
      );

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
