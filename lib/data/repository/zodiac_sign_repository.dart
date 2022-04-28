import 'package:relax_app/data/data_interface/i_zodiac_sign_repository.dart';
import 'package:relax_app/data/model/zodiac_sign.dart';
import 'package:relax_app/data/providers/api_provider.dart';

class ZodiacSignRepository implements IZodiacSignRepository {
  final ApiProvider _apiProvider;

  const ZodiacSignRepository(this._apiProvider);

  @override
  Future<List<ZodiacSign>> get signs async => _apiProvider.fetchSigns();
}
