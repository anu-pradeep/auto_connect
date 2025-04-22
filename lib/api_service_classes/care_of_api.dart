import 'dart:convert';
import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CareOfsApi {
  final Uri url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.careOfApi);
  final String sharedKey = 'careOfsData';

  Future<List<Map<String, dynamic>>> fetchCareOfs({int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    try {
      final response = await http.post(
        url.replace(queryParameters: {'page': page.toString()}),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final careOfsData = json.decode(response.body);
        final data = careOfsData['data']['careOfs']['data'] as List;

        final extractedData = data.map((careOf) => {
          'id': careOf['id'].toString(),
          'name': careOf['name'],
          // 'email': careOf['email'],
          // 'phone': careOf['phone'],
          // 'address': careOf['address'],
          // 'image': careOf['image'],
          // 'remark': careOf['remark'],
          // 'created_at': careOf['created_at'],
          // 'updated_at': careOf['updated_at'],
        }).toList();

        if (kDebugMode) {
          print('Fetched Care Ofs Data:');
          print(extractedData);
        }

        await prefs.setString(sharedKey, json.encode(extractedData));
        return extractedData;
      } else {
        if (kDebugMode) {
          print('API Error: ${response.statusCode} - ${response.body}');
        }
        throw Exception('Failed to fetch care ofs: ${response.reasonPhrase}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during API call: $e');
      }
      throw Exception('Failed to fetch care ofs');
    }
  }
}
