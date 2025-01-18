import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/models/models_exports.dart';

// String finalQuote = '';
// generateQuote() async {
//   const String uri = '	https://api.adviceslip.com/advice';
//   final response = await http.get(Uri.parse(uri));
//   print(response.body);
// }

final quoteProvider = FutureProvider<String>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final currentDate = DateTime.now().toIso8601String().split('T').first; // Get current date in yyyy-MM-dd format
  final storedDate = prefs.getString('quoteDate');
  final storedQuote = prefs.getString('quote');

  if (storedDate == currentDate && storedQuote != null) {
    // If quote is already stored for today, return the stored quote
    return storedQuote;
  } else {
    // If it's a new day, fetch a new quote
    const String uri = 'https://api.adviceslip.com/advice';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final quote = QuoteDataModel.fromJson(data); // Use the Quote model here

      // Store the new quote and the current date
      await prefs.setString('quote', quote.advice);
      await prefs.setString('quoteDate', currentDate);

      return quote.advice;
    } else {
      throw Exception('Failed to load advice');
    }
  }
});

