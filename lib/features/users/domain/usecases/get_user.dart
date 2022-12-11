import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';
import 'package:todo_app_backend/features/users/domain/repositories/user_repository.dart';

class GetUser {
  Future<UserModel> call(int userId) => sl<UserRepository>().getUser(userId);
}
