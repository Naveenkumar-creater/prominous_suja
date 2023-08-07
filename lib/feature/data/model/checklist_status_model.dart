import 'package:equatable/equatable.dart';

import '../../domain/entity/checklist_status_count_entity.dart';

class ChecklistStatusModel extends ChecklistStatusEntity {
  ChecklistStatusModel(
      {int? checklistOpenCount,
      int? checklistOverdue,
      int? checklistInprogress,
      int? checklistCompleted})
      : super(
            checklistOpenCount: checklistOpenCount,
            checklistOverdue: checklistOverdue,
            checklistInprogress: checklistInprogress,
            checklistCompleted: checklistCompleted);

  factory ChecklistStatusModel.fromJson(Map<String, dynamic> json) {
    return ChecklistStatusModel(
        checklistOpenCount: json['checklist_open_count'],
        checklistOverdue: json['checklist_overdue'],
        checklistInprogress: json['checklist_inprogress'],
        checklistCompleted: json['checklist_completed']);
  }

  Map<String, dynamic> toJson() {
    return {
      'checklist_open_count': checklistOpenCount,
      'checklist_overdue': checklistOverdue,
      'checklist_inprogress': checklistInprogress,
      'checklist_completed': checklistCompleted
    };
  }
}
