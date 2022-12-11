import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

class DeleteTask {
  Future<void> call(int taskId) => sl<TaskRepository>().deleteTask(taskId);
}
