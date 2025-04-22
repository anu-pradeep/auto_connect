import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StaffListClass {
  final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.staffListApi);
  final String staffKey = 'StaffData';
  Future<List<Map<String, dynamic>>> fetchStaffList({int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await http.post(url, headers: {
        'Authorization': 'Bearer $token',
      },
        body:{
          'page': page.toString(),
        }

      );

      if (response.statusCode == 200) {
        final staffData = json.decode(response.body);
        final data = staffData['data']['staffs']['data'] as List;
        final extractedData = data
            .map((staff) => {
                  'id': staff['id'],
                  'name': staff['name'],
                })
            .toList();
        if (kDebugMode) {
          print('Fetched page $page: $extractedData');
        }
        return extractedData;
      } else {
        if (kDebugMode) {
          print('API Error: ${response.statusCode} - ${response.body}');
        }
        throw Exception('Failed to fetch staff list: ${response.reasonPhrase}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during API call: $e');
      }
      throw Exception('Failed to fetch staff list');
    }
  }
}
