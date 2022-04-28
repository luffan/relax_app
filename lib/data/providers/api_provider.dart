import 'dart:convert';

import 'package:relax_app/data/model/zodiac_sign.dart';
import 'package:http/http.dart' as http;

const String _host = 'https://ohmanda.com/api/horoscope';

const List<String> _signs = [
  'aquarius',
  'pisces',
  'aries',
  'taurus',
  'gemini',
  'cancer',
  'leo',
  'virgo',
  'libra',
  'scorpio',
  'sagittarius',
  'capricorn',
];

class ApiProvider {
  Future<List<ZodiacSign>> fetchSigns() async {
    final List<ZodiacSign> signs = [];
    for (final sign in _signs) {
      final response = await http.get(
        Uri.parse('$_host/$sign'),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        signs.add(ZodiacSign.fromJson(json));
      }
    }

    return signs;
  }
}
