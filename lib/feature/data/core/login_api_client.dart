import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suja_shoie_app/feature/data/core/api_constant.dart';
import 'package:suja_shoie_app/feature/data/model/loginmodel.dart';

import '../data_source/Remote/login_data_source_impl.dart';

class LoginClient {
  dynamic post(String loginId, String password) async {
    Map<String, dynamic> requestData = {
      "client_aut_token": "atma-arh-diahome-341",
      "api_for": "Login",
      "login_id": loginId,
      "password": password,
      "client_id": "atma-arh-diahome"
    };

    try {
      http.Response response = await http.post(
        Uri.parse(ApiConstant.baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        if (responseBody.containsKey('response_data') &&
            responseBody['response_data']['user_login'] is List &&
            responseBody['response_data']['user_login'].isNotEmpty) {
          // Data is available, proceed with processing
          return LoginModel.fromJson(responseBody);
        } else {
          throw Exception("Invalid username or password");
        }
      }
    } catch (e) {
      throw Exception("Failed to make the API request: $e");
    }
  }
}
