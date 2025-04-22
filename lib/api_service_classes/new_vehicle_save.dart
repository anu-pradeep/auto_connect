import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_class/api_path.dart';

class VehicleSaveService{
  Future<Map<String, dynamic>> saveVehicle({
    required int stateId,
    required String plateType,
    required String registerNumber,
    required int registerYear,
    required int brandId,
    required int modelId,
    String? platePrefix,
    int? customerId,
    String? chassisNumber,
    String? engineNumber,
    String? colour,
    // String? image,
  }) async {

    final saveUrl = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.vehicleSaveApi);
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
        // body: jsonEncode({
        //   'state_id': stateId,
        //   'plate_type': plateType,
        //   'register_number': registerNumber,
        //   'register_year': registerYear,
        //   'brand_id': brandId,
        //   'plate_prefix': platePrefix,
        //   'customer_id': customerId,
        //   'chassis_number': chassisNumber,
        //   'engine_number': engineNumber,
        //   'colour': colour,
        //   // 'image': image,
        //   'is_imported': 0,
        // }),
        body: jsonEncode({
          'state_id': stateId,
          'plate_type': plateType,
          'register_number': registerNumber,
          'register_year': registerYear,
          'brand_id': brandId,
          'model_id': modelId,  // Add this line
          'plate_prefix': platePrefix,
          'customer_id': customerId,
          'chassis_number': chassisNumber,
          'engine_number': engineNumber,
          'colour': colour,
          'is_imported': 0,
        }),
      );

      // Print debug information in debug mode
      if (kDebugMode) {
        print('Save Vehicle Response Status Code: ${response.statusCode}');
        print('Save Vehicle Response Body: ${response.body}');
      }

      // Handle successful response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);
        return {
          'status': true,
          'data': responseData,
          'message': responseData['message'] ?? 'Vehicle saved successfully'
        };
      }
      // Handle unsuccessful response
      else {
        return {
          'status': false,
          'data': null,
          'message': 'Failed to save vehicle: ${response.body}'
        };
      }
    }
    // Handle any exceptions during the process
    catch (e) {
      if (kDebugMode) {
        print('Error saving vehicle: $e');
      }
      return {
        'status': false,
        'data': null,
        'message': 'An error occurred while saving vehicle'
      };
    }
  }


}



























// // File: services/vehicle_service.dart
// import 'package:auto_connect/api_class/api_path.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class VehicleService {
//
//
//   Future<Map<String, dynamic>> saveVehicle({
//     required String plateNo,
//     required String plateSource,
//     required String plateCategory,
//     String? platePrefix,
//     String? customerId,
//     required String brand,
//     required String model,
//     required String year,
//     String? chassisNo,
//     String? engineNo,
//     String? origin,
//     String? color,
//     required int firmId,
//   }) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(AutoConnectApi.baseurl+AutoConnectApi.vehicleSaveApi));
//
//
//       request.fields['state_id'] = firmId.toString();
//       request.fields['plate_type'] = plateSource;
//       request.fields['register_year'] = year;
//
//
//       if (plateNo.isNotEmpty) request.fields['register_number'] = plateNo;
//       if (platePrefix != null && platePrefix.isNotEmpty) request.fields['plate_prefix'] = platePrefix;
//       if (customerId != null && customerId.isNotEmpty) request.fields['customer_id'] = customerId;
//       if (chassisNo != null && chassisNo.isNotEmpty) request.fields['chassis_number'] = chassisNo;
//       if (engineNo != null && engineNo.isNotEmpty) request.fields['engine_number'] = engineNo;
//       if (brand.isNotEmpty) request.fields['brand'] = brand;
//       if (model.isNotEmpty) request.fields['model_id'] = model;
//       if (color != null && color.isNotEmpty) request.fields['color'] = color;
//
//       var response = await request.send();
//       var responseData = await response.stream.bytesToString();
//
//       return jsonDecode(responseData);
//     } catch (e) {
//       return {'success': false, 'message': e.toString()};
//     }
//   }
// }