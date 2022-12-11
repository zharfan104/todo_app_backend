import 'package:injectable/injectable.dart';
import 'package:todo_app_backend/core/datasource/datasource.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';
import 'package:todo_app_backend/features/users/domain/repositories/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({required this.dataSource});

  final DataSource dataSource;

  @override
  Future<void> addUser(UserModel user) => dataSource.addUser(user);

  @override
  Future<UserModel> getUser(int userId) => dataSource.getUser(userId);

  @override
  Future<void> updateUser(UserModel user) => dataSource.updateUser(user);

  @override
  Future<List<UserModel>> getAllUsers() {
    return dataSource.getAllUsers();
  }
}
