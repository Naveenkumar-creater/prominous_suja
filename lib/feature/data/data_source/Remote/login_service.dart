import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suja_shoie_app/feature/data/model/loginmodel.dart';
import 'package:suja_shoie_app/feature/data/model/usermodel.dart';

String baseUrl = "http://192.168.0.109:8081/AtmaInterfaceAPI/wsservice";

class LoginService {
  Future<LoginModel> loginInUser(String loginId, String password) async {
    Map<String, dynamic> requestData = {
      "client_aut_token": "atma-arh-diahome-340",
      "api_for": "Login",
      "login_id": loginId,
      "password": password,
      "client_id": "atma-arh-diahome"
    };

    try {
      http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Invalid email or password");
      }
    } catch (e) {
      throw e;
    }
  }
}
