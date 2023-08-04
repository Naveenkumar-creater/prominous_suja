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
        return jsonDecode(response.body);
      } else {
        throw Exception("Invalid  or password");
      }
    } catch (e) {
      throw e;
    }
  }
}
