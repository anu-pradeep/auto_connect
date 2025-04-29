import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CarModelClass {
  final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.carModelsApi);
  final String modelSharedKey = 'modelsData';
  Future<List<Map<String, dynamic>>> carModelList() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await http.post(url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        final modelsData = json.decode(response.body);
        final mdata = modelsData['data']['vehicle_models'] as List;
        final extractedData = mdata
            .map((vehiclemodel) => {
                  'id': vehiclemodel['id'].toString(),
                  'vehicle_brand_id':
                      vehiclemodel['vehicle_brand_id'].toString(),
                  'name': vehiclemodel['name'],
                })
            .toList();

        await prefs.setString(modelSharedKey, json.encode(extractedData));
        return extractedData;
      } else {
        throw Exception(
            'Failed to fetch vehicle brand models ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch vehicle brand models');
    }
  }
}
