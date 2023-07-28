import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suja_shoie_app/feature/data/model/usermodel.dart';

String baseUrl = "http://192.168.0.103:3000";

class ApiService {
  ApiService();

  Future<UserModel> signInUser(String email, String password) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/api/signin'),
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception("Invalid email or password");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserData(String token) async {
    try {
      var tokenRes = await http.post(
        Uri.parse("$baseUrl/api/tokenValidate"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse("$baseUrl/api/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'auth-token': token,
          },
        );

        return UserModel.fromJson(jsonDecode(userRes.body));
      } else {
        throw Exception("Invalid token");
      }
    } catch (e) {
      throw e;
    }
  }
}
