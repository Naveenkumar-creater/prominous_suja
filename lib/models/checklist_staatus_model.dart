class ChecklistStatus {
  List<ChecklistStatusCount>? checklistStatusCount;

  ChecklistStatus({this.checklistStatusCount});

  ChecklistStatus.fromJson(Map<String, dynamic> json) {
    if (json['checklist_status_count'] != null) {
      checklistStatusCount = <ChecklistStatusCount>[];
      json['checklist_status_count'].forEach((v) {
        checklistStatusCount!.add(ChecklistStatusCount.fromJson(v));
      });
    }
  }
}

class ChecklistStatusCount {
  int? checklistOpensCount;

  ChecklistStatusCount({this.checklistOpensCount});

  ChecklistStatusCount.fromJson(Map<String, dynamic> json) {
    checklistOpensCount = json['checklist_opens_count'];
  }
}
