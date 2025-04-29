import 'dart:convert';
import 'package:auto_connect/api_class/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashboardService {
  Future<Map<String, dynamic>> fetchDashboardData(int firm_id) async {
    final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.dashboardApi);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: {
          'firm_id' :firm_id.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == true) {
          return {
            'success': true,
            'data': data['data'],
          };
        } else {
          return {
            'success': false,
            'message': data['message'] ?? 'Failed to fetch dashboard data',
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
