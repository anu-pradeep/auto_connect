import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CarBrandsClass {
  final url =
      Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.carBrandsListApi);
  final String brandsShareKey = 'brandsData';
  Future<List<Map<String, dynamic>>> carBrandsList() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await http.post(url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        final brandsData = json.decode(response.body);
        final bdata = brandsData['data']['vehicle_brands'] as List;
        final extractedData = bdata
            .map((carbrand) => {
                  'id': carbrand['id'].toString(),
                  'name': carbrand['name'],
                })
            .toList();
        if (kDebugMode) {
          print('**********************');
          print(extractedData);
          print(token);
        }
        await prefs.setString(brandsShareKey, json.encode(extractedData));
        return extractedData;
      } else {
        if (kDebugMode) {
          print('API Error: ${response.statusCode} - ${response.body}');
        }
        throw Exception(
            'Failed to fetch vehicle brands ${response.reasonPhrase}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during API call: $e');
      }
      throw Exception('Failed to fetch vehicle brands');
    }
  }
}
