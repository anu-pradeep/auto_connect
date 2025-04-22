import 'dart:convert';
import 'package:auto_connect/api_class/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EnquiryListService
{
  Future<Map<String, dynamic>> fetchEnquiryList(int firm_id)
  async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse(AutoConnectApi.baseurl + AutoConnectApi.enquiryListApi);
    String? token = prefs.getString('token');

    try
        {
          final response = await http.post(url,
          headers: {
            'Authorization' : 'Bearer $token',
            'Accept': 'application/json',
          },
            body:
              {
                'firm_id' : firm_id.toString(),

              }
          );
          if (kDebugMode) {
            print('token is : $token');
          }
          if (kDebugMode) {
            print('firm id is : $firm_id');
          }
          if(response.statusCode == 200)
            {
              final data = json.decode(response.body);
              if(data['status']== true)
                {
                  return {
                        'success':true,
                        'data' : data['data'],
                      };
                }
              else{
                return {
                      'success': false,
                      'message' : data['message'] ?? 'Failed to fetch enquiry list',
                    };
              }
            }
          else
            {
              return {
                'success': false,
                'message' : 'HTTP Error: ${response.statusCode}'
              };
            }
        }
        catch (error)
    {
      return {
        'success' : false,
        'message' : 'An error occurred: $error',
      };
    }
  }
}