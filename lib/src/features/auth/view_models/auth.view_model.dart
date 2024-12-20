
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_pro/src/core/constants/app_colors.dart';
import 'package:login_pro/src/core/views/widgets/custom.snackbar.dart';

class AuthViewModel with ChangeNotifier {

  Future<bool> login(String baseUrl, String userName, String password, BuildContext context) async {
    final url = Uri.parse('https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke');
    final headers = {'Content-Type': 'application/json'};

    final body = {
      "API_Body": [
        {
          "Unique_Id": "",
          "Pw": password
        }
      ],
      "Api_Action": "GetUserData",
      "Company_Code": userName
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        customSnackBar(context, 'Login Success', backgroundColor: AppColors.success);
        return true;
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        print('Error: ${response.body}');
        customSnackBar(context, 'Login Failed');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      customSnackBar(context, 'Login Failed');
      return false;
    }
  }
}