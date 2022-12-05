import 'package:todo_app_backend/features/tasks/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    required super.completed,
    required super.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as int?,
      completed: json['completed'] as bool,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'completed': completed,
      'description': description,
    };
  }
}
