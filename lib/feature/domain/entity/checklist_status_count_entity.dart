import 'package:equatable/equatable.dart';

class ChecklistStatusEntity extends Equatable {
  final int? Count;

  ChecklistStatusEntity({
    this.Count,
  });

  @override
  List<Object?> get props {
    return [
      Count,
    ];
  }
}
