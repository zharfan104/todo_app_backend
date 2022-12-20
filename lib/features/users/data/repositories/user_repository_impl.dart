import 'package:injectable/injectable.dart';
import 'package:todo_app_backend/core/datasource/datasource.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';
import 'package:todo_app_backend/features/users/domain/entity/user_entity.dart';
import 'package:todo_app_backend/features/users/domain/repositories/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({required this.dataSource});

  final DataSource dataSource;

  @override
  Future<void> addUser(UserEntity user) => dataSource.addUser(
        UserModel(
          age: user.age,
          email: user.email,
          id: user.id,
          name: user.name,
          password: user.password,
        ),
      );

  @override
  Future<UserEntity> getUser(int userId) => dataSource.getUser(userId);

  @override
  Future<void> updateUser(UserEntity user) => dataSource.updateUser(
        UserModel(
          age: user.age,
          email: user.email,
          id: user.id,
          name: user.name,
          password: user.password,
        ),
      );

  @override
  Future<List<UserEntity>> getAllUsers() {
    return dataSource.getAllUsers();
  }
}
