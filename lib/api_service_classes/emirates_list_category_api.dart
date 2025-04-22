import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class EmiratesCategoryClass
{
  final url =  Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.emiratesCategoryListApi);
  final String sharingKey = 'emiratesData';
  Future<List<Map<String ,dynamic>>> emiratesCategoryList()
  async
  {
    final prefs = await SharedPreferences.getInstance();
    String ? token = prefs.getString('token');
    try
        {
          final response = await http.post(url,headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          });
          if(response.statusCode == 200)
            {
              final emiratesData = json.decode(response.body);
              final data =emiratesData['data']['emirates'] as List;
              final extractedData = data.map((emirate)=>{
                'id':emirate['id'].toString(),
                'name' :emirate['name'],
              }).toList();
              if (kDebugMode) {
                print('**********************'); print(extractedData);
                print(token);
              }
              await prefs.setString(sharingKey, json.encode(extractedData));
              return extractedData;
            }
          else{
            if (kDebugMode) {
              print('API Error: ${response.statusCode} - ${response.body}');
            }
            throw Exception('Failed to fetch emirates category: ${response.reasonPhrase}');
          }
        }
    catch (e) {
      if (kDebugMode) {
        print('Error during API call: $e');
      }
      throw Exception('Failed to fetch emirates category');
    }
  }
}