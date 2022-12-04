import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';

abstract class LocalDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<List<TaskModel>> getAllTasks(int userId);
}
