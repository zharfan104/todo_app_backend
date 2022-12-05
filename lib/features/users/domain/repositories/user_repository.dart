import 'package:todo_app_backend/features/users/data/models/user_model.dart';

abstract class UserRepository {
  Future<void> addUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<UserModel> getUser(int userId);
  Future<List<UserModel>> getAllUsers();
}
