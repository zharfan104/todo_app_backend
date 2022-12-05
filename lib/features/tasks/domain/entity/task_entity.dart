import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  const TaskEntity({
    required this.id,
    required this.completed,
    required this.description,
  });

  final int? id;
  final bool completed;
  final String description;

  @override
  List<Object?> get props => [id, completed, description];
}
