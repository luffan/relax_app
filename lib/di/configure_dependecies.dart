import 'package:relax_app/di/modules/client_module.dart';

import 'modules/cubit_module.dart';
import 'modules/i_register_interface.dart';
import 'modules/provider_module.dart';
import 'modules/repository_module.dart';

Future<void> configureDependencies() async {
  final List<IRegisterInterface> modules = [
    ProviderModule(),
    ClientModule(),
    RepositoryModule(),
    CubitModule(),
  ];

  for (final module in modules) {
    await module.registerDependencies();
  }
}
