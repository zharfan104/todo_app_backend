import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/core/jwt/jwt_service.dart';
import 'package:todo_app_backend/di.dart';
import 'package:todo_app_backend/features/users/domain/usecases/get_all_users.dart';

class UserRequest {
  const UserRequest._();

  static Future<Response> getUsers(RequestContext context) async {
    return _getAllUsers(context);
  }

  static Future<Response> _getAllUsers(RequestContext context) async {
    final middleWare = sl<JwtService>();
    final verifyToken = await middleWare.verifyToken(context);
    final getAllUsersUsescase = GetAllUsers();

    if (!verifyToken) {
      return ResponseHelper.unAuthorized();
    } else {
      final users = await getAllUsersUsescase();
      return ResponseHelper.json(
        status: HttpStatus.ok,
        message: 'Successfully get all Users',
        body: users,
      );
    }
  }
}
