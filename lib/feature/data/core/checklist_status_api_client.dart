import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suja_shoie_app/feature/data/model/checklist_status_model.dart';

import 'api_constant.dart';

class CheckListStatusClient {
  dynamic get() async {
    Map<String, dynamic> requestData = {
      "client_aut_token": "atma-arh-diahome-324",
      "api_for": "check_list_status_count",
      "checklist_status": "1",
      "inspection_by": "1",
      "from_date_time": "2023-09-01 10:00:00",
      "to_date_time": "2023-09-02 10:00:00",
      "client_id": "atma-arh-diahome"
    };

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
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        if (responseBody['response_data']['checklist_status'] is List &&
            responseBody['response_data']['checklist_status'].isNotEmpty) {
          // Data is available, proceed with processing
          return ChecklistStatusModel.fromJson(responseBody);
        } else {
          throw Exception("no valid data ");
        }
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
