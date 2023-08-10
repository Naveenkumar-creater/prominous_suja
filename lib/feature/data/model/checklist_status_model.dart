import 'package:equatable/equatable.dart';

import '../../domain/entity/checklist_status_count_entity.dart';

class ChecklistStatusModel extends ChecklistStatusEntity {
  ChecklistStatusModel({int? Count})
      : super(
          Count: Count,
        );

  factory ChecklistStatusModel.fromJson(Map<String, dynamic> json) {
    return ChecklistStatusModel(
      Count: json['count'],
    );
  }
}
