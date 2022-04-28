import 'package:relax_app/data/data_interface/i_zodiac_sign_repository.dart';
import 'package:relax_app/data/providers/api_provider.dart';
import 'package:relax_app/data/repository/zodiac_sign_repository.dart';
import 'package:relax_app/di/locator.dart';

import 'i_register_interface.dart';

class RepositoryModule implements IRegisterInterface {
  @override
  Future<void> registerDependencies() async {
    locator.registerSingleton<IZodiacSignRepository>(
      ZodiacSignRepository(
        locator<ApiProvider>(),
      ),
    );
  }
}
