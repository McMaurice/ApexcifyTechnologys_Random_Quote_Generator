import 'package:http/http.dart' as http;
import 'package:quote_generator/quote_generator.dart';

class QuoteService {
  static const _endpoint = 'https://dummyjson.com/quotes/random';

  static Future<QuoteModel> fetchRandom() async {
    final response = await http.get(Uri.parse(_endpoint)).timeout(const Duration(seconds: 8));

    if (response.statusCode == 200) {
      return QuoteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load quote (${response.statusCode})');
    }
  }
}
