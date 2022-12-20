import 'package:todo_app_backend/features/tasks/domain/entity/task_entity.dart';

abstract class TaskRepository {
  Future<void> addTask(int userId, TaskEntity task);
  Future<void> deleteTask(int taskId);
  Future<void> updateTask(TaskEntity task);
  Future<TaskEntity> getTask(int taskId);
  Future<List<TaskEntity>> getAllTasks(int userId);
}
