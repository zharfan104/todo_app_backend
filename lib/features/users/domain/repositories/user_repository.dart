import 'package:todo_app_backend/features/users/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<void> addUser(UserEntity user);
  Future<void> updateUser(UserEntity user);
  Future<UserEntity> getUser(int userId);
  Future<List<UserEntity>> getAllUsers();
}
