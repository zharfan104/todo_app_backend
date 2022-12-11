import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

class GetTask {
  Future<TaskModel> call(int taskId) => sl<TaskRepository>().getTask(taskId);
}
