import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/tasks/domain/entity/task_entity.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

class GetTask {
  Future<TaskEntity> call(int taskId) => sl<TaskRepository>().getTask(taskId);
}
