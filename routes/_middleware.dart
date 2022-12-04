import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_todos_data_source/in_memory_todos_data_source.dart';
import 'package:todo_app_backend/core/jwt/jwt_service.dart';
import 'package:todos_data_source/todos_data_source.dart';

final _dataSource = InMemoryTodosDataSource();
final JwtService jwtService = JwtServiceImpl();

Handler middleware(Handler handler) {
  return handler
      // .use(requestLogger())
      .use(provider<TodosDataSource>((_) => _dataSource))
      .use(provider<JwtService>((_) => jwtService));
}
