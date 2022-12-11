import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/extensions/request_method_x.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/features/users/presentations/user_request.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.httpMethodGet) {
    return UserRequest.getAllUsers(context);
  }

  return ResponseHelper.methodNotAllowed();
}
