import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suja_shoie_app/feature/data/core/checklist_status_api_client.dart';

import 'package:suja_shoie_app/feature/data/data_source/Remote/remote_abstract/checklist_status_data_source.dart';
import 'package:suja_shoie_app/feature/data/data_source/checklist_status_data_source_impl.dart';

import 'package:suja_shoie_app/feature/data/repository/checklist_status_repository_impl.dart';

import 'package:suja_shoie_app/feature/domain/entity/checklist_status_count_entity.dart';

import 'package:suja_shoie_app/feature/domain/repository/checklist_status_count_repository.dart';

import 'package:suja_shoie_app/feature/domain/usecase/checklist_status_count_usecase.dart';
import 'package:suja_shoie_app/feature/presentaion/providers/checklist_status_count_provider.dart';

class ChecklistStatusService {
  void getStatusCount(BuildContext context) async {
    try {
      CheckListStatusClient checkListClient =
          CheckListStatusClient(); // Create an instance of ApiClient
      CheckListDataSource CheckListData = CheckListDataSourceimpl(
          checkListClient); // Pass the ApiClient instance to ApiService
      CheckListStausRepository checklistRepository =
          ChecklistRepositoryImpl(CheckListData);
      ; // Create the LoginRepository implementation
      CheckListStatusCountUseCase checkListUseCase =
          CheckListStatusCountUseCase(
              checklistRepository); // Create the use case
      // ignore: unused_local_variable

      ChecklistStatusEntity user = await checkListUseCase.execute();

      var checkliststatus =
          Provider.of<CheckListStatusCountProvider>(context, listen: false);
      checkliststatus.setUser(user);
      print(checkliststatus);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

void showSnackBar(BuildContext? context, String message) {
  if (context != null) {
    final snackBar = SnackBar(
      backgroundColor: Colors.amber[400],
      content:
          Center(child: Text(message, style: TextStyle(color: Colors.black))),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
