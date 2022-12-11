import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';
import 'package:todo_app_backend/features/users/domain/repositories/user_repository.dart';

class AddUser {
  Future<void> call(UserModel user) => sl<UserRepository>().addUser(user);
}
