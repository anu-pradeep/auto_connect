
import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VehicleListClass {
  final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.vehicleListApi);
  final String sharedKey = 'vehicleData';
  Future<List<Map<String, dynamic>>> fetchVehicleList(  {int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await http.post(url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
          body: {
            // 'firm_id': firm_id.toString(),
            'page': page.toString(),
          }
      );
      if (response.statusCode == 200) {
        final vehicleData = json.decode(response.body);
        final data = vehicleData['data']['vehicles']['data'] as List;
        final extractedData = data
            .map((vehicle) => {
          'id': vehicle['id'].toString(),
          'plate_prefix': vehicle['plate_prefix'],
          'register_number': vehicle['register_number'],
          'customer_id': vehicle['customer_id'],
        })
            .toList();
        if (kDebugMode) {
          print('**********************');
          print(extractedData);
          print(token);
        }
        await prefs.setString(sharedKey, json.encode(extractedData));
        return extractedData;
      } else {
        if (kDebugMode) {
          print('API Error: ${response.statusCode} - ${response.body}');
        }
        throw Exception('Failed to fetch vehicles: ${response.reasonPhrase}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during API call: $e');
      }
      throw Exception('Failed to fetch vehicle');
    }
  }
}
// import 'dart:convert';
//
// import 'package:auto_connect/api_class/api_path.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class VehicleListClass {
//   final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.vehicleListApi);
//   final String sharedKey = 'vehicleData';
//
//   Future<List<Map<String, dynamic>>> fetchVehicleList({int page = 1}) async {
//     final prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     try {
//       final response = await http.post(
//           url,
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Accept': 'application/json',
//           },
//           body: {
//             'page': page.toString(),
//           }
//       );
//
//       if (response.statusCode == 200) {
//         final vehicleData = json.decode(response.body);
//         final data = vehicleData['data']['vehicles']['data'] as List;
//
//         if (kDebugMode && data.isNotEmpty) {
//           print(' vehicle data from API:');
//           print(data.first);
//         }
//
//         final extractedData = data
//             .map((vehicle) => {
//           'id': vehicle['id'].toString(),
//           'plate_prefix': vehicle['plate_prefix'] ?? '',
//           'register_number': vehicle['register_number'] ?? '',
//           'customer_id': vehicle['customer_id'] ?? '',
//
//           'state_name': vehicle['state_name'] ?? '',
//           'plate_type': vehicle['plate_type'] ?? '',
//           'model_id': vehicle['model_id'] ?? 0,
//           'brand_id': vehicle['brand_id'] ?? 0,
//
//         })
//             .toList();
//
//         if (kDebugMode) {
//           print('**********************');
//           print('Extracted data:');
//           print(extractedData.first);
//           print('Token: $token');
//         }
//
//         await prefs.setString(sharedKey, json.encode(extractedData));
//         return extractedData;
//       } else {
//         if (kDebugMode) {
//           print('API Error: ${response.statusCode} - ${response.body}');
//         }
//         throw Exception('Failed to fetch vehicles: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error during API call: $e');
//       }
//       throw Exception('Failed to fetch vehicle');
//     }
//   }
// }