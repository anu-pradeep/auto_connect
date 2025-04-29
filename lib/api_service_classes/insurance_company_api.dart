import 'dart:convert';

import 'package:auto_connect/api_class/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class InsuranceCompanyList{
  final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.insuranceCompanyListApi);
  final String shareInsuranceKey = 'InsuranceCompanyData';
  Future<List<Map<String,dynamic>>> fetchInsuranceCompany(int firm_id)
  async {
    final prefs = await SharedPreferences.getInstance();
    String ? token = prefs.getString('token');
    try
        {
          final response = await http.post(url,
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
              body: {
                'firm_id': firm_id.toString(),
              }
          );
          if(response.statusCode == 200)
            {
              final insuranceCompanyData =json.decode(response.body);
              final insuranceData = insuranceCompanyData['data']['insuranceCompanies']as List;
              final extractedData = insuranceData
              .map((company)=>{
                'id': company['id'],
                'name': company['name'],
              }).toList();
             await prefs.setString(shareInsuranceKey, json.encode(extractedData));
              return extractedData;
            } else {

            throw Exception(
                'Failed to fetch insurance companies: ${response.reasonPhrase}');
          }
        } catch (e) {

      throw Exception('Failed to fetch insurance companies');
    }
  }

}