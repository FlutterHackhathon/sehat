import 'dart:convert';
import 'package:http/http.dart' as http;
Future<Map<String, dynamic>> newsapi(String key,http.Client httpClient) async {
  final httpResponse = await httpClient.get('https://newsapi.org/v2/top-headlines?country=in&sortBy=publishedAt&language=en&q=covid-19&apiKey=$key');
  if (httpResponse.statusCode == 200) {
    final jsonBody = json.decode(httpResponse.body);
    return jsonBody;
  } else {
    throw Exception();
  }
}