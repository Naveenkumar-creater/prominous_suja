import 'package:suja_shoie_app/feature/data/core/checklist_status_api_client.dart';
import 'package:suja_shoie_app/feature/data/data_source/Remote/remote_abstract/checklist_status_data_source.dart';
import 'package:suja_shoie_app/feature/data/model/checklist_status_model.dart';

class CheckListDataSourceimpl extends CheckListDataSource {
  final CheckListStatusClient checkListStatusClient;

  CheckListDataSourceimpl(this.checkListStatusClient);

  @override
  Future<ChecklistStatusModel> getChecklistStatusCount() async {
    final result = await checkListStatusClient.get();
    return result;
  }
}
