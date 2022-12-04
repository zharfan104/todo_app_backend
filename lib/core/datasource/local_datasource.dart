import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';

abstract class LocalDataSource {
  Future<void> addUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<UserModel> getUser(int userId);
  Future<List<UserModel>> getAllUsers();

  Future<void> addTask(int userId, TaskModel task);
  Future<void> deleteTask(int taskId);
  Future<void> updateTask(TaskModel task);
  Future<List<TaskModel>> getAllTasks(int userId);
}
