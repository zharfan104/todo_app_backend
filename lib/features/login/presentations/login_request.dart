import 'dart:io';
import 'dart:math' as math;
import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/extensions/binding.dart';
import 'package:todo_app_backend/core/helpers/content_type_helper.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/core/jwt/jwt_service.dart';
import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/users/domain/usecases/get_all_users.dart';

class LoginRequest {
  const LoginRequest._();

  static Future<Response> loginUser(RequestContext context) async {
    final middleWare = sl<JwtService>();
    final randomNumber = math.Random().nextInt(999);
    final getAllUsersUsescase = GetAllUsers();
    final users = await getAllUsersUsescase();

    if (ContentTypeHelper.identify(context) == ContentType.json) {
      final requestBody = await context.shouldBindJSON();

      final loggedinUser = users.where(
        (element) => element.userName == requestBody['user_name'] && element.password == requestBody['password'],
      );

      final token = await middleWare.generateToken({
        'id': loggedinUser.isEmpty ? randomNumber : loggedinUser.first.id,
      });

      return loggedinUser.isEmpty
          ? ResponseHelper.abortWithStatus(
              status: HttpStatus.ok,
              message: 'User not found',
            )
          : ResponseHelper.json(
              status: HttpStatus.ok,
              message: 'Login Successfully',
              token: token,
              body: loggedinUser.first,
            );
    } else {
      return ResponseHelper.badRequest(message: 'Request is not a JSON');
    }
  }
}
