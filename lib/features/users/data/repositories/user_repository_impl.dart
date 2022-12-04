import 'package:todo_app_backend/core/datasource/local_datasource.dart';
import 'package:todo_app_backend/core/datasource/local_datasource_impl.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';
import 'package:todo_app_backend/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final LocalDataSource localDataSource = LocalDataSourceImpl();

  @override
  Future<List<UserModel>> getAllUsers() async {
    final users = await localDataSource.getAllUsers();
    return users;
  }
}
