import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoService {
  final String baseUrl =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false';

  Future<List<dynamic>> fetchCryptos() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load cryptocurrency data');
      }
    } catch (e) {
      throw Exception('Error fetching cryptocurrency data: $e');
    }
  }
}
