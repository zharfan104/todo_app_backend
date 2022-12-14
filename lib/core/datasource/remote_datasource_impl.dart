import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:todo_app_backend/core/datasource/datasource.dart';
import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/users/data/models/user_model.dart';

@Singleton(as: DataSource)
class RemoteDataSourceImpl extends DataSource {
  RemoteDataSourceImpl({required this.database});

  final PostgreSQLConnection database;

  @override
  Future<void> addUser(UserModel user) async {
    await database.mappedResultsQuery(
      '''
      INSERT INTO public."User"(name, email, password, age)
      VALUES ('${user.name}', '${user.email}', '${user.password}', ${user.age});
      ''',
    );
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await database.mappedResultsQuery(
      '''
      UPDATE Public."User"
      SET name = '${user.name}',
      age = ${user.age}, 
      email = '${user.email}', 
      password = '${user.password}'
      WHERE id = ${user.id};
      ''',
    );
  }

  @override
  Future<UserModel> getUser(int userId) async {
    final rawUsers = await database.mappedResultsQuery(
      '''
      select * from Public."User"
      where id = $userId
      ''',
    );

    final userModels = List<UserModel>.from(
      rawUsers.map(
        (user) => UserModel.fromJson(user['User']!),
      ),
    );

    return userModels.first;
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    final rawUsers = await database.mappedResultsQuery(
      '''select * from Public."User"''',
    );

    final userModels = List<UserModel>.from(
      rawUsers.map(
        (user) => UserModel.fromJson(user['User']!),
      ),
    );

    return userModels;
  }

  @override
  Future<void> addTask(int userId, TaskModel task) async {
    await database.mappedResultsQuery(
      '''
      INSERT INTO public."Task"(description, completed, user_id)
      VALUES ('${task.description}', ${task.completed}, $userId);
      ''',
    );
  }

  @override
  Future<void> deleteTask(int taskId) async {
    await database.mappedResultsQuery(
      '''
      DELETE FROM public."Task"
      Where id = $taskId;
      ''',
    );
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final setDescriptionQuery = task.description != null ? 'description = ${task.description},' : '';

    await database.mappedResultsQuery(
      '''
      UPDATE Public."Task"
      SET $setDescriptionQuery
      completed = ${task.completed}
      WHERE id = ${task.id};
      ''',
    );
  }

  @override
  Future<List<TaskModel>> getAllTasks(int userId) async {
    final rawTasks = await database.mappedResultsQuery(
      '''
      select * from Public."Task"
      where user_id = $userId
      ''',
    );

    final taskModels = List<TaskModel>.from(
      rawTasks.map(
        (user) => TaskModel.fromJson(user['Task']!),
      ),
    );

    return taskModels;
  }

  @override
  Future<TaskModel> getTask(int taskId) async {
    final rawTasks = await database.mappedResultsQuery(
      '''
      select * from Public."Task"
      where id = $taskId
      ''',
    );

    final taskModels = List<TaskModel>.from(
      rawTasks.map(
        (user) => TaskModel.fromJson(user['Task']!),
      ),
    );

    return taskModels.first;
  }
}
