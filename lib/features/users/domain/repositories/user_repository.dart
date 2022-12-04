import 'package:todo_app_backend/features/users/data/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getAllUsers();
}
