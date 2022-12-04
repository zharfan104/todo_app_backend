import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

class GetAllTasks {
  final TaskRepository taskRepository = TaskRepositoryImpl();

  Future<List<TaskModel>> call(int userId) async {
    final tasks = await taskRepository.getAllTasks(userId);
    return tasks;
  }
}
