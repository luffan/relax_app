import 'package:relax_app/data/model/zodiac_sign.dart';

abstract class IZodiacSignRepository {
  Future<List<ZodiacSign>> get signs;
}
