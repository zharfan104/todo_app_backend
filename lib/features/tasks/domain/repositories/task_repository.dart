import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';

abstract class TaskRepository {
  Future<void> addTask(int userId, TaskModel task);
  Future<void> deleteTask(int taskId);
  Future<void> updateTask(TaskModel task);
  Future<TaskModel> getTask(int taskId);
  Future<List<TaskModel>> getAllTasks(int userId);
}
