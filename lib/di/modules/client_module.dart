import 'package:relax_app/data/clients/auth_client.dart';
import 'package:relax_app/data/data_interface/i_auth_client.dart';
import 'package:relax_app/di/locator.dart';

import 'i_register_interface.dart';

class ClientModule implements IRegisterInterface {
  @override
  Future<void> registerDependencies() async {
    locator.registerSingleton<IAuthClient>(
      AuthClient(),
    );
  }
}
