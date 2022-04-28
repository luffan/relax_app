import 'package:relax_app/data/data_interface/i_auth_client.dart';
import 'package:relax_app/data/data_interface/i_zodiac_sign_repository.dart';
import 'package:relax_app/di/locator.dart';
import 'package:relax_app/presentation/pages/app/app_cubit.dart';
import 'package:relax_app/presentation/pages/auth/sign_in/sign_in_cubit.dart';
import 'package:relax_app/presentation/pages/auth/sign_up/sign_up_cubit.dart';
import 'package:relax_app/presentation/pages/main/main_cubit.dart';

import 'i_register_interface.dart';

class CubitModule implements IRegisterInterface {
  @override
  Future<void> registerDependencies() async {
    locator.registerSingleton<AppCubit>(
      AppCubit(
        locator<IAuthClient>(),
      ),
    );
    locator.registerSingleton<SignInCubit>(
      SignInCubit(
        locator<IAuthClient>(),
      ),
    );
    locator.registerSingleton<SignUpCubit>(
      SignUpCubit(
        locator<IAuthClient>(),
      ),
    );
    locator.registerSingleton(
      MainCubit(
        locator<IZodiacSignRepository>(),
        locator<IAuthClient>(),
      ),
    );
  }
}
