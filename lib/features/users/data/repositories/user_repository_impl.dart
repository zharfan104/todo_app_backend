import 'package:injectable/injectable.dart';
import 'package:todo_app_backend/core/datasource/datasource.dart';
import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';
import 'package:todo_app_backend/features/users/domain/repositories/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final DataSource localDataSource = sl();

  @override
  Future<void> addUser(UserModel user) => localDataSource.addUser(user);

  @override
  Future<UserModel> getUser(int userId) => localDataSource.getUser(userId);

  @override
  Future<void> updateUser(UserModel user) => localDataSource.updateUser(user);

  @override
  Future<List<UserModel>> getAllUsers() async {
    final users = await localDataSource.getAllUsers();
    return users;
  }
}
