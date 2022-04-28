import 'package:relax_app/data/providers/api_provider.dart';
import 'package:relax_app/di/locator.dart';

import 'i_register_interface.dart';

class ProviderModule implements IRegisterInterface {
  @override
  Future<void> registerDependencies() async {
    locator.registerSingleton<ApiProvider>(
      ApiProvider(),
    );
  }
}
