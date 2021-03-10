
import 'dart:convert';

import 'package:http/http.dart' as http;

// /// This method will return the total statistics
// Future<Map<String, dynamic>> allCovidInfo(http.Client httpClient) async { 
//   final httpResponse = await httpClient.get('https://corona.lmao.ninja/v3/covid-19/all');
//   if (httpResponse.statusCode == 200) {
//     final jsonBody = json.decode(httpResponse.body);
//     return jsonBody;
//   } else {
//     throw Exception();
//   }
// }


/// This method will return the statistics based on the country
Future<Map<String, dynamic>> countryCovidInfo(String country,http.Client httpClient) async {
  final httpResponse = await httpClient.get('https://corona.lmao.ninja/v3/covid-19/countries/$country');
  if (httpResponse.statusCode == 200) {
    final jsonBody = json.decode(httpResponse.body);
    return jsonBody;
  } else {
    throw Exception();
  }
}