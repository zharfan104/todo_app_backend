import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getAllTasks(int userId);
}
