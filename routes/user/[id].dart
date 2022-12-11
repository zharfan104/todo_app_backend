import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/extensions/request_method_x.dart';
import 'package:todo_app_backend/features/users/presentations/user_request.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  if (context.httpMethodGet) {
    final idInInteger = int.parse(id);

    return UserRequest.getUser(context, idInInteger);
  }

  return Response(statusCode: HttpStatus.methodNotAllowed);
}
