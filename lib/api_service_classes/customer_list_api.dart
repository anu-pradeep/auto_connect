// import 'dart:convert';
//
// import 'package:auto_connect/api_class/api_path.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class CustomerListClass {
//   final url =
//       Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.customerListApi);
//   final String shareKey = 'CustomersData';
//   Future<List<Map<String, dynamic>>> fetchCustomerList(int firm_id) async {
//     final prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     try {
//       final response = await http.post(url, headers: {
//         'Authorization': 'Bearer $token',
//         'Accept': 'application/json',
//       }, body: {
//         'firm_id': firm_id.toString(),
//       });
//       if (response.statusCode == 200) {
//         final customersData = json.decode(response.body);
//         final data = customersData['data']['customers']['data'] as List;
//         final extractedData = data
//             .map((customer) => {
//                   'id': customer['id'],
//                   'name': customer['name'],
//                 })
//             .toList();
//         if (kDebugMode) {
//           print('**********************');
//           print(extractedData);
//           print(token);
//         }
//         await prefs.setString(shareKey, json.encode(extractedData));
//         return extractedData;
//       } else {
//         if (kDebugMode) {
//           print('API Error: ${response.statusCode} - ${response.body}');
//         }
//         throw Exception('Failed to fetch customer list: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error during API call: $e');
//       }
//       throw Exception('Failed to fetch customer list');
//     }
//   }
// }
/// scroll controller added api code
// import 'dart:convert';
//
// import 'package:auto_connect/api_class/api_path.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class CustomerListClass {
//   final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.customerListApi);
//   final String shareKey = 'CustomersData';
//
//   Future<List<Map<String, dynamic>>> fetchCustomerList(int firm_id, {int page = 1}) async {
//     final prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     try {
//       final response = await http.post(url, headers: {
//         'Authorization': 'Bearer $token',
//         'Accept': 'application/json',
//       }, body: {
//         'firm_id': firm_id.toString(),
//         'page': page.toString(), // Add page parameter
//       });
//
//       if (response.statusCode == 200) {
//         final customersData = json.decode(response.body);
//         final data = customersData['data']['customers']['data'] as List;
//
//         // Extract customer data
//         final extractedData = data
//             .map((customer) => {
//           'id': customer['id'],
//           'name': customer['name'],
//         })
//             .toList();
//
//         if (kDebugMode) {
//           print('**********************');
//           print(extractedData);
//           print(token);
//         }
//
//         await prefs.setString(shareKey, json.encode(extractedData));
//         return extractedData;
//       } else {
//         if (kDebugMode) {
//           print('API Error: ${response.statusCode} - ${response.body}');
//         }
//         throw Exception('Failed to fetch customer list: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error during API call: $e');
//       }
//       throw Exception('Failed to fetch customer list');
//     }
//   }
// }
// ************************************
import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomerListClass {
  final url =
      Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.customerListApi);
  final String shareKey = 'CustomersData';

  Future<List<Map<String, dynamic>>> fetchCustomerList(int firm_id,
      {int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      final response = await http.post(url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      }, body: {
        'firm_id': firm_id.toString(),
        'page': page.toString(),
      });

      if (response.statusCode == 200) {
        final customersData = json.decode(response.body);
        final data = customersData['data']['customers']['data'] as List;

        final extractedData = data
            .map((customer) => {
                  'id': customer['id'],
                  'name': customer['name'],
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
        throw Exception(
            'Failed to fetch customer list: ${response.reasonPhrase}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during API call: $e');
      }
      throw Exception('Failed to fetch customer list');
    }
  }
}
