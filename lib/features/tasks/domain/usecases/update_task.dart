import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

class UpdateTask {
  Future<void> call(TaskModel task) => sl<TaskRepository>().updateTask(task);
}
