import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

class GetAllTasks {
  Future<List<TaskModel>> call(int userId) => sl<TaskRepository>().getAllTasks(userId);
}
