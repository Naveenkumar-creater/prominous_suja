import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suja_shoie_app/feature/data/model/checklist_status_model.dart';
import 'package:suja_shoie_app/feature/data/model/request_data_model.dart';

import 'api_constant.dart';

class CheckListStatusClient {
  dynamic getStatusCount(
      int count, DateTime fromDate, DateTime toDate, String token) async {
    ApiRequestDataModel requestData = ApiRequestDataModel(
      clientAuthToken: token,
      apiFor: "check_list_status_count",
      checklistStatus: count,
      fromDateTime: fromDate,
      toDateTime: toDate,
      clientId: "atma-arh-diahome",
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
