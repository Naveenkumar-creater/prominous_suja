import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suja_shoie_app/feature/data/model/checklist_status_model.dart';
import 'package:suja_shoie_app/feature/data/model/request_data_model.dart';

import 'api_constant.dart';

class CheckListStatusClient {
  dynamic getStatusCount(int count, String toDate, String token) async {
    ApiRequestDataModel requestData = ApiRequestDataModel(
      clientAuthToken: token,
      apiFor: "check_list_status_count",
      checklistStatus: count,
      fromDateTime: "2023-09-01 10:00:00",
      toDateTime: toDate,
      clientId: "admin",
    );

    final timeoutDuration =
        Duration(seconds: 10); // Define your desired timeout duration

    try {
      http.Response response = await http
          .post(
            Uri.parse(ApiConstant.baseUrl),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(requestData),
          )
          .timeout(timeoutDuration); // Add the timeout parameter here

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } on TimeoutException {
      // Handle timeout error
      throw Exception(
          'Connection timed out. Please check your internet connection.');
    } catch (e) {
      throw Exception("Failed to make the API request: $e");
    }
  }
}
