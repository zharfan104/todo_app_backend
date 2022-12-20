import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/core/jwt/jwt_service.dart';
import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/tasks/data/models/task_model.dart';
import 'package:todo_app_backend/features/tasks/domain/usecases/add_task.dart';
import 'package:todo_app_backend/features/tasks/domain/usecases/delete_task.dart';
import 'package:todo_app_backend/features/tasks/domain/usecases/get_all_tasks.dart';
import 'package:todo_app_backend/features/tasks/domain/usecases/get_task.dart';
import 'package:todo_app_backend/features/tasks/domain/usecases/update_task.dart';

class TaskRequest {
  TaskRequest._();

  static Future<Response> addTask(RequestContext context) async {
    return _addTask(context);
  }

  static Future<Response> _addTask(RequestContext context) async {
    final taskJson = await context.request.json() as Map<String, dynamic>;
    final task = TaskModel.fromJson(taskJson);

    final middleWare = sl<JwtService>();
    final userId = await middleWare.getUserId(context);
    final addTaskUsescase = AddTask();

    await addTaskUsescase(userId, task);

    return ResponseHelper.json(
      status: HttpStatus.ok,
      message: 'Successfully add the task',
      body: taskJson,
    );
  }

  static Future<Response> updateTask(RequestContext context, int taskId) async {
    return _updateTask(context, taskId);
  }

  static Future<Response> _updateTask(RequestContext context, int taskId) async {
    final taskJson = await context.request.json() as Map<String, dynamic>;

    taskJson['id'] = taskId;

    final task = TaskModel.fromJson(taskJson);

    final updateTaskUseCase = UpdateTask();

    await updateTaskUseCase(task);

    return ResponseHelper.json(
      status: HttpStatus.ok,
      message: 'Successfully update the task',
      body: taskJson,
    );
  }

  static Future<Response> deleteTask(RequestContext context, int taskId) async {
    return _deleteTask(context, taskId);
  }

  static Future<Response> _deleteTask(RequestContext context, int taskId) async {
    final deleteTaskUsescase = DeleteTask();
    await deleteTaskUsescase(taskId);

    return ResponseHelper.successEmpty(
      message: 'Successfully delete task',
    );
  }

  static Future<Response> getTask(RequestContext context, int taskId) async {
    return _getTask(context, taskId);
  }

  static Future<Response> _getTask(RequestContext context, int taskId) async {
    final getTaskUsescase = GetTask();
    final task = await getTaskUsescase(taskId);

    return ResponseHelper.json(
      status: HttpStatus.ok,
      message: 'Successfully get task',
      body: {
        'id': task.id,
        'completed': task.completed,
        'description': task.description,
      },
    );
  }

  static Future<Response> getAllTasks(RequestContext context) async {
    return _getAllTasks(context);
  }

  static Future<Response> _getAllTasks(RequestContext context) async {
    final middleWare = sl<JwtService>();
    final getAllTasksUsescase = GetAllTasks();

    final userId = await middleWare.getUserId(context);
    final tasks = await getAllTasksUsescase(userId);

    return ResponseHelper.json(
      status: HttpStatus.ok,
      message: 'Successfully get all Tasks',
      body: tasks,
    );
  }
}
