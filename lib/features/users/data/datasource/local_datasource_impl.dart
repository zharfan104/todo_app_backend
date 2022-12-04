import 'package:postgres/postgres.dart';
import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/users/data/datasource/local_datasource.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<List<UserModel>> getAllUsers() async {
    final database = sl<PostgreSQLConnection>();

    final rawUsers = await database.mappedResultsQuery('select * from Public."User"');

    final userModels = List<UserModel>.from(
      rawUsers.map(
        (user) => UserModel.fromJson(user['User']!),
      ),
    );

    return userModels;
  }
}
