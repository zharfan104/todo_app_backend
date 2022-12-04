import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_todos_data_source/in_memory_todos_data_source.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/core/jwt/jwt_service.dart';
import 'package:todo_app_backend/di.dart';
import 'package:todos_data_source/todos_data_source.dart';

final _dataSource = InMemoryTodosDataSource();
const _authenticationUrl = ['login', 'register'];

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(
        provider<TodosDataSource>((_) => _dataSource),
      )
      .use(_verifyTokenHandler);
}

Handler _verifyTokenHandler(Handler handler) {
  return (context) async {
    final middleWare = sl<JwtService>();
    final isTokenVerified = await middleWare.verifyToken(context);
    final url = context.request.url.toString();
    final isAuthenticationUrl = _authenticationUrl.contains(url);
    final isNeedVerifiedToken = !isAuthenticationUrl;

    if (isNeedVerifiedToken) {
      if (!isTokenVerified) {
        return ResponseHelper.unAuthorized();
      }
    }

    final response = await handler(context);

    return response;
  };
}
