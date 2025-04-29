import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginFunctionClass {
  final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.loginApi);
  Future<bool> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response =
          await http.post(url, body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == true) {
          prefs.setString('token', data['data']['token']);
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

          return true;
        } else {
          return false;
        }
      } else {
        throw Exception('Error : ${response.reasonPhrase}');
      }
    } catch (e) {
      return false;
    }
  }
}
