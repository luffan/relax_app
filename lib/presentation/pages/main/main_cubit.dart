import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relax_app/data/data_interface/i_auth_client.dart';
import 'package:relax_app/data/data_interface/i_zodiac_sign_repository.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final IZodiacSignRepository _zodiacSignRepository;
  final IAuthClient _authClient;

  String get name => _authClient.currentUser.name;

  MainCubit(
    this._zodiacSignRepository,
    this._authClient,
  ) : super(
          const MainState(
            signs: [],
          ),
        );

  void init() async {
    final signs = await _zodiacSignRepository.signs;
    emit(state.copyWith(signs: signs));
  }
}
