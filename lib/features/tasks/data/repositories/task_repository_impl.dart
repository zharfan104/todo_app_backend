import 'package:injectable/injectable.dart';
import 'package:todo_app_backend/core/datasource/datasource.dart';
import 'package:todo_app_backend/core/datasource/remote_datasource_impl.dart';
import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

@Singleton(as: TaskRepository)
class TaskRepositoryImpl extends TaskRepository {
  final DataSource localDataSource = RemoteDataSourceImpl();

  @override
  Future<List<TaskModel>> getAllTasks(int userId) async {
    final tasks = await localDataSource.getAllTasks(userId);

    return tasks;
  }
}
