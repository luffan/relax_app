import 'package:relax_app/data/model/zodiac_sign.dart';

class MainState {
  final List<ZodiacSign> signs;

  const MainState({
    required this.signs,
  });

  MainState copyWith({
    List<ZodiacSign>? signs,
  }) {
    return MainState(signs: signs ?? this.signs);
  }
}
