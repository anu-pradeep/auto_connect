// import 'dart:convert';
//
// import 'package:auto_connect/api_class/api_path.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class LoginFunctionClass {
//   Future<bool> login(String email, String password) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.loginApi);
//     try {
//       final response =
//           await http.post(url, body: {'email': email, 'password': password});
//       print('Response body : ${response.body}');
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data['success'] == true) {
//           prefs.setString('token', data['data']['token']); // storing the token
//           prefs.setString('email', email);
//           prefs.setString('password', password);
//           // prefs.setString('first_name', '${data['data']['user_details']['name']}');
//           // prefs.setInt('id', data['data']['user_details']['id']);
//           // prefs.setInt('mobile', data['data']['user_details']['mobile']);
//           prefs.setBool('logged_in', true);
//           final userdetails = data['data']['user_details'];
//           prefs.setString('first_name', '${userdetails['name']}');
//           prefs.setInt('id', userdetails['id']);
//           prefs.setInt('mobile', userdetails['mobile']);
//           prefs.setBool('logged_in', true);
//           print('********************');
//           print(email);
//           print(password);
//           print('********************');
//
//           return true;
//         } else {
//           print('Login failed : ${data['message']}');
//           return false;
//         }
//       } else {
//         throw Exception('Error : ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       print('Error: $e');
//       return false;
//     }
//   }
// }
import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginFunctionClass {
  final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.loginApi);
  Future<bool> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response =
          await http.post(url, body: {'email': email, 'password': password});
      if (kDebugMode) {
        print('Response body : ${response.body}');
      }
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == true) {
          prefs.setString('token', data['data']['token']); // storing the token
          prefs.setString('email', email);
          prefs.setString('password', password);


          final userdetails = data['data']['user_details'];

          final int id = int.parse(userdetails['id'].toString());
          prefs.setInt('id', id);
          prefs.setInt('id', userdetails['id']);

          final String mobile = userdetails['mobile'].toString();
          prefs.setString('mobile', mobile);
          final String name = userdetails['name'].toString();
          prefs.setString('name', name);
          prefs.setString('job_title', userdetails['job_title']);
          prefs.setBool('logged_in', true);

          if (kDebugMode) {
            print('******************** logged in successfully');
          }
          if (kDebugMode) {
            print('email $email');
          }
          if (kDebugMode) {
            print('password $password');
          }
          if (kDebugMode) {
            print(id);
          }
          if (kDebugMode) {
            print(mobile);
          }
          if (kDebugMode) {
            print(id);
          }
          if (kDebugMode) {
            print(name);
          }
          if (kDebugMode) {
            print('********************');
          }
          return true;
        } else {
          if (kDebugMode) {
            print('Login failed : ');
          }
          return false;
        }
      } else {
        throw Exception('Error : ${response.reasonPhrase}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return false;
    }
  }
}
