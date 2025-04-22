
import 'dart:convert';
import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EnquiryService {
  Future<Map<String, dynamic>> saveEnquiry({
    required String customerId,
    required String vehicleId,
    required int firmId,
    required String odoMeter,
    required String description,
    required bool isInsured,
    String? policyNumber,
    String? policeReportNumber,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? userId = prefs.getInt('id');
    // int? firmId = prefs.getInt('firm_id');

    if (userId == null) {
      return {
        'success': false,
        'message': 'User ID not found. Please login again.',
      };
    }

    final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.enquirySaveApi);

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: {
          'customer_id': customerId,
          'vehicle_id': vehicleId,
          'user_id': userId.toString(),
          'firm_id': firmId.toString(),
          'odo_meter': odoMeter,
          'description': description,
          'is_insured': isInsured ? '1' : '0',
          if (isInsured) 'policy_number': policyNumber ?? '',
          if (isInsured) 'police_report_number': policeReportNumber ?? '',
        },
      );

      if (kDebugMode) {
        print('Response: ${response.body}');
      }

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(firmId);
        print(userId);
        if (data['status'] == true) {
          return {
            'success': true,
            'data': data['data'],
          };
        } else {
          return {
            'success': false,
            'message': data['message'] ?? 'Failed to save enquiry',
          };
        }
      } else {
        return {
          'success': false,
          'message': 'HTTP Error: ${response.statusCode}',
        };
      }
    } catch (error) {
      return {
        'success': false,
        'message': 'An error occurred: $error',
      };
    }
  }
}