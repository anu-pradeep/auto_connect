import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_class/api_path.dart';

class CustomerSaveService {
  Future<Map<String, dynamic>> saveCustomer(
      {required int firmId,
      required String name,
      required String email,
      required String phone,
      String? customerTypeId,
      String? contactPerson,
      String? contactNo,
      String? creditOrCash,
      int? careOfId}) async {
    final saveUrl =
        Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.customerSaveApi);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    try {
      final response = await http.post(
        saveUrl,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'firm_id': firmId,
          'name': name,
          'email': email,
          'phone': phone,
          'customer_type_id': customerTypeId,
          'contact_person': contactPerson,
          'contact_no': contactNo,
          'credit_or_cash': creditOrCash ?? 'credit',
          'care_of_id': careOfId,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);
        return {
          'status': true,
          'data': responseData,
          'message': responseData['message'] ?? 'Customer saved successfully'
        };
      } else {
        return {
          'status': false,
          'data': null,
          'message': 'Failed to save customer: ${response.body}'
        };
      }
    } catch (e) {
      return {
        'status': false,
        'data': null,
        'message': 'An error occurred while saving customer'
      };
    }
  }
}
