import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<PostgreSQLConnection> database() async {
    final database = PostgreSQLConnection(
      'localhost',
      5432,
      'todoapp',
      username: 'no_one',
      password: 'no_one',
    );

    await database.open();

    return database;
  }
}
