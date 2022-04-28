class ZodiacSign {
  final String sign;
  final String horoscope;

  const ZodiacSign({
    required this.sign,
    required this.horoscope,
  });

  factory ZodiacSign.fromJson(Map<String?, dynamic> json) {
    return ZodiacSign(
      sign: json['sign'] ?? '',
      horoscope: json['horoscope'] ?? '',
    );
  }
}
