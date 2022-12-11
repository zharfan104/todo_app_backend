import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/extensions/request_method_x.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/core/jwt/jwt_service.dart';
import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/users/presentations/user_request.dart';

Future<Response> onRequest(RequestContext context) async {
  final userId = await sl<JwtService>().getUserId(context);

  if (context.httpMethodGet) {
    return UserRequest.getUser(context, userId);
  }

  if (context.httpMethodPut) {
    return UserRequest.updateUser(context, userId);
  }

  return ResponseHelper.methodNotAllowed();
}
