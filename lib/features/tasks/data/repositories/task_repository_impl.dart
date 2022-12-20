import 'package:injectable/injectable.dart';
import 'package:todo_app_backend/core/datasource/datasource.dart';
import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/tasks/domain/entity/task_entity.dart';
import 'package:todo_app_backend/features/tasks/domain/repositories/task_repository.dart';

@Singleton(as: TaskRepository)
class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl({required this.localDataSource});

  final DataSource localDataSource;

  @override
  Future<void> addTask(int userId, TaskEntity task) => localDataSource.addTask(
        userId,
        TaskModel(
          completed: task.completed,
          description: task.description,
          id: task.id,
        ),
      );

  @override
  Future<void> deleteTask(int taskId) => localDataSource.deleteTask(taskId);

  @override
  Future<void> updateTask(TaskEntity task) => localDataSource.updateTask(
        TaskModel(
          completed: task.completed,
          description: task.description,
          id: task.id,
        ),
      );

  @override
  Future<List<TaskEntity>> getAllTasks(int userId) async {
    final tasks = await localDataSource.getAllTasks(userId);

    return tasks;
  }

  @override
  Future<TaskEntity> getTask(int taskId) async {
    final task = await localDataSource.getTask(taskId);

    return task;
  }
}
