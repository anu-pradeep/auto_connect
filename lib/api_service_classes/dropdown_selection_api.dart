import 'dart:convert';
import 'package:auto_connect/api_class/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class FirmSelectionClass
{
  final url = Uri.parse(AutoConnectApi.baseurl+AutoConnectApi.firmApi);
  final String sharedPrefsKey = 'firmsData';
  Future<List<Map<String, dynamic>>> fetchFirms() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

      try {
        final response = await http.post(url, headers: {
          'Authorization': 'Bearer $token',
        },);

        if (response.statusCode == 200) {
          final apiData = json.decode(response.body);
          final data = apiData['data']['firms'] as List;

          final extractedData = data
              .map((firm) => {
            'id': firm['id'],
            'name': firm['name'],
          })
              .toList();

          await prefs.setString(sharedPrefsKey, json.encode(extractedData));
          return extractedData;
        } else {

          throw Exception('Failed to fetch firms: ${response.reasonPhrase}');
        }
      } catch (e) {

        throw Exception('Failed to fetch firms');
      }

  }

}