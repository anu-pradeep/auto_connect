import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerTypeClass {
  final url =
      Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.customerTypeApi);
  final String customerTypeKey = 'customerType';
  Future<List<Map<String, dynamic>>> fetchCustomerType() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final customerType = json.decode(response.body);
        final data = customerType['data']['customer-types'] as List;

        final extractedData = data
            .map((customerType) => {
                  'id': customerType['id'],
                  'name': customerType['name'],
                })
            .toList();

        await prefs.setString(customerTypeKey, json.encode(extractedData));
        return extractedData;
      } else {

        throw Exception(
            'Failed to fetch customer type: ${response.reasonPhrase}');
      }
    } catch (e) {

      throw Exception('Failed to fetch customer type');
    }
  }
}
