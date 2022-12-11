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

  static Future<Response> login(RequestContext context) async {
    if (ContentTypeHelper.identify(context) == ContentType.json) {
      final requestBody = await context.shouldBindJSON();

      return loginUser(
        email: requestBody['email'] as String?,
        password: requestBody['password'] as String?,
      );
    } else {
      return ResponseHelper.badRequest(message: 'Request is not a JSON');
    }
  }

  static Future<Response> loginUser({required String? email, required String? password}) async {
    final middleWare = sl<JwtService>();
    final randomNumber = math.Random().nextInt(999);
    final getAllUsersUsescase = GetAllUsers();
    final users = await getAllUsersUsescase();

    final loggedinUser = users.where(
      (element) => element.email == email && element.password == password,
    );

    final token = await middleWare.generateToken({
      'id': loggedinUser.isEmpty ? randomNumber : loggedinUser.first.id,
    });

    return loggedinUser.isEmpty
        ? ResponseHelper.abortWithStatus(
            status: HttpStatus.badRequest,
            message: 'User not found',
          )
        : ResponseHelper.json(
            status: HttpStatus.ok,
            message: 'Login Successfully',
            token: token,
            body: loggedinUser.first,
          );
  }
}
