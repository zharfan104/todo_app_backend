import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/users/domain/entity/user_entity.dart';
import 'package:todo_app_backend/features/users/domain/repositories/user_repository.dart';

class GetUser {
  Future<UserEntity> call(int userId) => sl<UserRepository>().getUser(userId);
}
