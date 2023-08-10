import '../entity/checklist_status_count_entity.dart';
import '../entity/loginentity.dart';

abstract class CheckListStausRepository {
  Future<ChecklistStatusEntity> getChecklistStatusCount(
      int count, DateTime fromDate, DateTime toDate, String token);
}
