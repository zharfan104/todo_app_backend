import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/core/jwt/jwt_service.dart';
import 'package:todo_app_backend/features/tasks/domain/usecases/get_all_tasks.dart';

class TaskRequest {
  TaskRequest._();

  static Future<Response> getAllTasks(RequestContext context) async {
    return _getAllTasks(context);
  }

  static Future<Response> _getAllTasks(RequestContext context) async {
    final middleWare = context.read<JwtService>();
    final verifyToken = await middleWare.verifyToken(context);
    final getAllTasksUsescase = GetAllTasks();

    if (!verifyToken) {
      return ResponseHelper.unAuthorized();
    } else {
      final userId = await middleWare.getUserId(context);
      final tasks = await getAllTasksUsescase(userId);

      return ResponseHelper.json(
        status: HttpStatus.ok,
        message: 'Successfully get all Tasks',
        body: tasks,
      );
    }
  }
}
