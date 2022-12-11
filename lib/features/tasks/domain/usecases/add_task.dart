import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

class AddTask {
  Future<void> call(int userId, TaskModel task) => sl<TaskRepository>().addTask(userId, task);
}
