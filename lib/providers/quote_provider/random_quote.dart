import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/quote_data_model.dart';
import 'package:todo_app/providers/provider_exports.dart';

// String finalQuote = '';
// generateQuote() async {
//   const String uri = '	https://api.adviceslip.com/advice';
//   final response = await http.get(Uri.parse(uri));
//   print(response.body);
// }

final quoteProvider = FutureProvider<QuoteDataModel>((ref) async {
  const String url = 'https://api.adviceslip.com/advice';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Parse the response to get the advice text
    final data = json.decode(response.body);
    return QuoteDataModel.fromJson(data);
  } else {
    throw Exception('Failed to load advice');
  }
});
