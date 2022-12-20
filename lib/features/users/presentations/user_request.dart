import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/features/users/domain/entity/user_entity.dart';
import 'package:todo_app_backend/features/users/domain/usecases/add_user.dart';
import 'package:todo_app_backend/features/users/domain/usecases/get_all_users.dart';
import 'package:todo_app_backend/features/users/domain/usecases/get_user.dart';
import 'package:todo_app_backend/features/users/domain/usecases/update_user.dart';

class UserRequest {
  const UserRequest._();

  static Future<Response> updateUser(RequestContext context, int userId) async {
    return _updateUser(context, userId);
  }

  static Future<Response> _updateUser(RequestContext context, int userId) async {
    final userJson = await context.request.json() as Map<String, dynamic>;

    userJson['id'] = userId;

    final user = UserEntity.fromJson(userJson);
    final updateUserUsescase = UpdateUser();

    await updateUserUsescase(user);

    return ResponseHelper.json(
      status: HttpStatus.ok,
      message: 'Successfully update user',
      body: user,
    );
  }

  static Future<Response> getUser(RequestContext context, int userId) async {
    return _getUser(context, userId);
  }

  static Future<Response> _getUser(RequestContext context, int userId) async {
    final getUserUsescase = GetUser();

    final user = await getUserUsescase(userId);

    return ResponseHelper.json(
      status: HttpStatus.ok,
      message: 'Successfully get user',
      body: user,
    );
  }

  static Future<UserEntity> addUser(RequestContext context) async {
    return _addUser(context);
  }

  static Future<UserEntity> _addUser(RequestContext context) async {
    final userJson = await context.request.json() as Map<String, dynamic>;
    final user = UserEntity.fromJson(userJson);
    final addUserUsescase = AddUser();

    await addUserUsescase(user);

    return user;
  }

  static Future<Response> getAllUsers(RequestContext context) async {
    return _getAllUsers(context);
  }

  static Future<Response> _getAllUsers(RequestContext context) async {
    final getAllUsersUsescase = GetAllUsers();

    final users = await getAllUsersUsescase();

    return ResponseHelper.json(
      status: HttpStatus.ok,
      message: 'Successfully get all users',
      body: users,
    );
  }
}
