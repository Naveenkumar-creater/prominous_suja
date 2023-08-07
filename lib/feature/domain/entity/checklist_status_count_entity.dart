import 'package:equatable/equatable.dart';

class ChecklistStatusEntity extends Equatable {
  final int? checklistOpenCount;
  final int? checklistOverdue;
  final int? checklistInprogress;
  final int? checklistCompleted;

  ChecklistStatusEntity({
    this.checklistOpenCount,
    this.checklistOverdue,
    this.checklistInprogress,
    this.checklistCompleted,
  });

  @override
  List<Object?> get props {
    return [
      checklistOpenCount,
      checklistOverdue,
      checklistInprogress,
      checklistCompleted,
    ];
  }
}
