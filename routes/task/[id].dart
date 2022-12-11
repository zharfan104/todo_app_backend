import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/features/tasks/presentations/task_request.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  final idInInteger = int.parse(id);

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, idInInteger);
    case HttpMethod.put:
      return _put(context, idInInteger);
    case HttpMethod.delete:
      return _delete(context, idInInteger);
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, int taskId) {
  return TaskRequest.getTask(context, taskId);
}

Future<Response> _put(RequestContext context, int taskId) {
  return TaskRequest.updateTask(context, taskId);
}

Future<Response> _delete(RequestContext context, int taskId) {
  return TaskRequest.deleteTask(context, taskId);
}
